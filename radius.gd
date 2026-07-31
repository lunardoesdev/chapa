@tool
class_name Tower
extends Node2D

@export_range(1, 500, 1, "prefer_slider") var radius = 40:
	set(value):
		radius = value
		queue_redraw()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color(0.122, 0.424, 0.753, 0.49))
