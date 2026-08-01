extends Node

const enemy = preload("res://enemy.tscn")

signal gold_changed(value: int)
signal lives_changed(value: int)

var time = 0
var lives = 20
var gold = 50
var curve: Curve2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var path = $Map/EnemyPath
	curve = path.curve
	gold_changed.connect($HUD._on_gold_changed)
	lives_changed.connect($HUD._on_lives_changed)
	$HUD.set_values(gold, lives)
	
	var screenSize: Vector2i = DisplayServer.screen_get_size()
	
	var window = get_window()
	window.content_scale_size = screenSize
	
	
	var camera: Camera2D = $Map/Camera2D
	var bg: TileMapLayer = $Map/TileLayers/bg
	var layers = $Map/TileLayers
	var bgRect = bg.get_used_rect()
	var bgSize = (Vector2(bgRect.size) * bg.rendering_quadrant_size)
	var ratio = Vector2(screenSize) / bgSize
	var smallSide = min(ratio.x, ratio.y)
	ratio = Vector2(smallSide, smallSide)
	camera.global_position = bg.global_position + bgSize / 2
	window.content_scale_size = bgSize


func on_enemy_died():
	gold = gold + 5
	gold_changed.emit(gold)

func on_goal_reached():
	lives = lives - 1
	lives_changed.emit(lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time + delta
	if time > 0.5:
		var mob: Enemy = enemy.instantiate()

		mob.died.connect(on_enemy_died)
		mob.goal_reached.connect(on_goal_reached)
		mob.set_curve(curve)
		
		$Map/Enemies.add_child(mob)
		time = 0
		
		# print("enemies on map: ", get_tree().get_nodes_in_group("enemies").size())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
