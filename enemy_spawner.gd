extends Node

const enemy = preload("res://enemy.tscn")

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time + delta
	if time > 0.5:
		var mob: Enemy = enemy.instantiate()
		
		var game = $"../Game"
		mob.died.connect(game.on_enemy_died)
		mob.goal_reached.connect(game.on_goal_reached)
		
		$"..".add_child(mob)
		time = 0
