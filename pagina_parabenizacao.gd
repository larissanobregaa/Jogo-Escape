extends Control  # Ou o tipo apropriado para sua cena

@onready var audio_player = $AudioStreamPlayer  # Referência ao nó AudioStreamPlayer

# Função chamada quando a cena é carregada
func _ready() -> void:
	audio_player.play()  # Começa a tocar a música

# Função chamada quando o botão "Play Again" é pressionado
func _on_PlayAgainButton_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")  # Altere para o caminho correto da sua cena inicial

func _on_button_pressed() -> void:
	pass  # Este método pode ser removido se não for necessário
