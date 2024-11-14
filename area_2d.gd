extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "Personagem":  # Verifica se o objeto que entrou na área é o personagem
		get_tree().reload_current_scene()  # Reinicia a cena atual
