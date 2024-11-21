extends Area2D


func _on_body_entered(body):
	if body.name == 'Personagem':
		get_tree().change_scene_to_file("res://fase_2.tscn")
	pass # Replace with function body.
