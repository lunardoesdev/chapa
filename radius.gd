@tool
extends Node2D

var radius = 42

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color(0.122, 0.424, 0.753, 0.49))
