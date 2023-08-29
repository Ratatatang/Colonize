extends Node2D

@onready var world = $World

func _ready():
	world.generateGrid()
	$World/Pathfinding.initialize()
