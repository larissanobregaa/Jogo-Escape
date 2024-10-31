extends Area2D


func _on_body_entered(body):
	if body.name == 'Personagem': 
		get_tree().reload_current_scene()
	pass # Replace with function body.
