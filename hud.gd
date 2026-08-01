extends CanvasLayer

@onready var gold_label = $Root/GoldLabel
@onready var lives_label = $Root/LivesLabel

func set_values(gold: int, lives: int) -> void:
	gold_label.text = "Gold: %d" % gold
	lives_label.text = "Lives: %d" % lives

func _on_gold_changed(val: int) -> void:
	gold_label.text = "Gold: %d" % val
	
func _on_lives_changed(val: int) -> void:
	lives_label.text = "Lives: %d" % val
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
