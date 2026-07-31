extends Node

var lives = 20
var gold = 50

func on_enemy_died():
	gold = gold + 5
	print("Gold: ", gold)

func on_goal_reached():
	lives = lives - 1
	print("Lives: ", lives)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
