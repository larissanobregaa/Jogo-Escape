extends Area2D

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout  # Aguarda 2 segundos
	get_tree().change_scene_to_file("res://fase_2.tscn")
