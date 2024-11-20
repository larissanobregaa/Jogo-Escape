extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	var next_scene = "res://fase_2.tscn"  # Altere para o caminho correto
	var scene = load(next_scene)
	get_tree().change_scene(next_scene)  # Replace with function body.
