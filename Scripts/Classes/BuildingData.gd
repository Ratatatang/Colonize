class_name BuildingData
extends Resource

@export var name: String
@export var texture: Texture
@export var unbuiltTexture: Texture
@export var width: int = 1
@export var height: int = 1
@export var resourceReq: Dictionary
@export var workReq: int
@export var isRestingSpot: bool = false
@export var recipes: Array[RecipeData]
