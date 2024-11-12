extends Area2D

signal moeda_coletada  # Sinal para acionar ao coletar moeda

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("Moedas") 
	

func _on_body_entered(body):
	if body.name == "Personagem":  
		emit_signal("moeda_coletada")  # Emite o sinal de coleta
		call_deferred("queue_free")
