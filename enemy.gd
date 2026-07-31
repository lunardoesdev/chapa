extends Node2D

var path_idx = 0
var curve: Curve2D
var speed = 50


func check_finish() -> void:
	check_path_collide()
	if path_idx > (curve.point_count - 1):
		self.hide()
		self.queue_free()


func check_path_collide() -> void:
	if curve.get_point_position(path_idx).distance_to(global_position) < speed * 0.01:
		path_idx = path_idx + 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var path = $"../EnemyPath"
	curve = path.get_curve()
	global_position = curve.get_point_position(path_idx)
	check_path_collide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target = curve.get_point_position(path_idx)
	global_position = global_position + (target - global_position).normalized() * speed * delta
	check_finish()
