extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if body.name == 'Personagem':
		get_tree().change_scene_to_file("res://final_jogo.tscn")
	pass # Replace with function body.
