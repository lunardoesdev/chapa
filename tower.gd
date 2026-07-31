@tool
class_name Tower
extends Node2D

var clock = 0
var dmg = 5
var target: Enemy
@export_range(1, 350, 10, "prefer_slider") var radius = 40:
	set(value):
		radius = value
		self.queue_redraw()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	
	clock = clock + delta
	
	if clock > 0.005:
		if target != null and target.global_position.distance_to(self.global_position):
			target = null
		for e: Enemy in get_tree().get_nodes_in_group("enemies"):
			var dist = e.global_position.distance_to(self.global_position)
			if dist <= radius:
				if target == null:
					target = e
				elif e.get_progress() > target.get_progress():
					target = e
				look_at(target.global_position)
				target.take_damage(0)
				queue_redraw()
		clock = 0

func _draw() -> void:
	if target == null:
		pass
	else:
		draw_circle(Vector2.ZERO, radius, Color(0.122, 0.424, 0.753, 0.118))
		draw_line(Vector2.ZERO, to_local(target.global_position), Color(0.0, 0.774, 0.0, 1.0), 10)
