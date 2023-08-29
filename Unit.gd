class_name Unit
extends Area2D

@onready var game = get_tree().root.get_node("Game")
@onready var world = game.get_node("World")
@onready var pathfind = world.get_node("Pathfinding")

var data: UnitData

var speed = 100

var path: Array
var pos: Vector2: 
	get:
		return pos
	set(value):
		pos = value

func _process(delta):
	move(delta)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var clicked = world.worldToGrid(get_global_mouse_position())
			path = pathfind.getPath(pos, clicked)

func move(delta):
	if path.size() > 0:
		if position.distance_to(world.gridToWorld(path[0])) < 5:
			position = world.gridToWorld(path[0])
			pos = path[0]
			path.pop_front()
		else:
			position += (world.gridToWorld(path[0]) - position).normalized() * data.speed * delta
