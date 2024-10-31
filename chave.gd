extends Area2D

signal moeda_coletada  # Sinal para acionar ao coletar moeda

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered")) 

func _on_body_entered(body):
	if body.name == "Personagem":  
		emit_signal("moeda_coletada")  # Emite o sinal de coleta
		queue_free()  # Remove a moeda da cena
