class_name Grid
extends Node2D

@export var width = 12
@export var height = 12
@export var cellSize = 128

var grid = {}

@export var showDebug = false
func generateGrid():
	for x in width:
		for y in height:
			var pos = Vector2(x,y)
			grid[pos] = null
			if showDebug:
				var rect = ReferenceRect.new()
				rect.position = gridToWorld(pos)
				rect.size = Vector2(cellSize, cellSize)
				rect.editor_only = false
				$Debug.add_child(rect)
				var label = Label.new()
				label.position = gridToWorld(pos)
				label.text = str(pos)
				$Debug.add_child(label)

func gridToWorld(pos : Vector2):
	return pos * cellSize

func worldToGrid(pos : Vector2):
	return floor(pos / cellSize)
