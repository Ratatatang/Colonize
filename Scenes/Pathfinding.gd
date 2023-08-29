class_name Pathfinder
extends Node

var aStar = AStar2D.new()
@onready var game = get_tree().root.get_node("Game")
@onready var world = game.get_node("World")

const DIRECTIONS = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]

func initialize():
	addPoints()
	connectAllPoints()

func addPoints():
	var curID = 0
	for point in world.grid:
		aStar.add_point(curID, world.gridToWorld(point))
		curID += 1

func getPointID(gridPoint: Vector2):
	return aStar.get_closest_point(world.gridToWorld(gridPoint))

func getWorldID(worldPoint: Vector2):
	return aStar.get_closest_point(worldPoint)

func getIDWorldPos(id: int):
	return aStar.get_point_position(id)

func getIDGridPos(id):
	var worldPos = getIDWorldPos(id)
	return world.worldToGrid(worldPos)

func connectPoints(point: Vector2):
	var pointID = getPointID(point)
	for direction in DIRECTIONS:
		var neighbor = point + direction
		var neighborID = getPointID(neighbor)
		if world.grid.has(neighbor) and world.grid[neighbor] == null:
			aStar.connect_points(pointID, neighborID)

func disconnectPoints(point: Vector2):
	var pointID = getPointID(point)
	for direction in DIRECTIONS:
		var neighbor = point + direction
		var neightborID = getPointID(neighbor)
		aStar.disconnect_points(pointID, neightborID)

func connectAllPoints():
	for point in world.grid:
		connectPoints(point)

func getPath(pointA: Vector2, pointB: Vector2):
	var aID = getPointID(pointA)
	var bID = getPointID(pointB)
	return Array(aStar.get_point_path(aID, bID))
