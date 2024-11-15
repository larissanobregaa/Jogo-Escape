extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "CollisionShape2D":  # Verifica se o objeto que entrou na área é o personagem
		get_tree().change_scene_to_file("res://fase_2.tscn")
