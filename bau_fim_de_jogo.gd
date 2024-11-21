extends Area2D

# Uma variável que vai armazenar a imagem de "Game Over"
@export var parabenizacao: TextureRect

# Função que será chamada quando algo colidir com o baú
func _on_body_entered(body):
	if body.name == "Personagem":  # Verifica se o objeto que colidiu é o personagem
		parabenizacao.visible = true  # Torna a imagem de "Game Over" visível
		await get_tree().idle_frame  # Espera até o próximo quadro
		get_tree().paused = true  # Pausa o jogo
