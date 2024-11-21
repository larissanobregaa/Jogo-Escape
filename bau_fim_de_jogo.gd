extends Area2D

# Função que será chamada quando algo colidir com o baú
func _on_body_entered(body):
	if body.name == "Personagem":  # Verifica se o objeto que colidiu é o personagem
		print("Personagem colidiu com o baú!")  # Mensagem de depuração
		get_tree().change_scene_to_file("res://pagina_parabenizacao.tscn")  # Altere para o caminho correto da sua cena de parabenização
