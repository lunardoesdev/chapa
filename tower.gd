@tool
class_name Tower
extends Node2D

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
	
	var target: Node2D = null
	for e: Enemy in get_tree().get_nodes_in_group("enemies"):
		var dist = e.position.distance_to(self.position)
		if dist <= radius:
			if target == null:
				target = e
			elif dist < target.position.distance_to(self.position):
				target.scale = Vector2(1.0, 1.0)
				target = e
			target.scale = Vector2(2.0, 2.0)
			look_at(target.position)
				

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color(0.122, 0.424, 0.753, 0.49))
