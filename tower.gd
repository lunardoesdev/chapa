@tool
class_name Tower
extends Node2D

const BulletScene = preload("res://bullet.tscn")

var clock = 0
var dmg = 10
var target: Enemy

@export_range(0.1, 5, 0.1) var fire_rate = 0.5

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
	
	if clock > fire_rate:
		if target != null and !is_instance_valid(target):
			target = null

		if target != null and target.global_position.distance_to(self.global_position) > radius:
			target = null
		for e: Enemy in get_tree().get_nodes_in_group("enemies"):
			var dist = e.global_position.distance_to(self.global_position)
			if dist <= radius:
				if target == null:
					target = e
				elif e.get_progress() > target.get_progress():
					target = e
		
		if !is_instance_valid(target):
			return
		look_at(target.global_position)
		var bullet: Bullet = BulletScene.instantiate()
		bullet.set_target(target)
		bullet.set_damage(dmg)
		self.add_child(bullet)
		queue_redraw()
		clock = 0

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color(0.122, 0.424, 0.753, 0.118))
	if target == null:
		pass
	else:
		#draw_line(Vector2.ZERO, to_local(target.global_position), Color(0.0, 0.774, 0.0, 1.0), 10)
		pass
