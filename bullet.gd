extends Node2D
class_name Bullet

var target: Enemy
var px_per_second = 120
var radius = 7
var damage = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_instance_valid(target):
		self.queue_free()
		return
	var dist = target.global_position - self.global_position
	if dist.length() < radius:
		target.take_damage(damage)
		self.queue_free()
	var step = dist.normalized() * px_per_second * delta
	self.global_position += step


func set_target(t: Enemy) -> Bullet:
	target = t
	return self

func set_damage(dmg: int) -> Bullet:
	damage = dmg
	return self
