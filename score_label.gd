extends Label

var score = 0

func _ready():
	# Conecta o sinal 'moeda_coletada' de cada moeda na cena ao ScoreLabel
	for moeda in get_tree().get_nodes_in_group("Moedas"):
		moeda.connect("moeda_coletada", Callable(self, "_on_moeda_coletada"))

func _on_moeda_coletada():
	score += 1  # Incrementa a pontuação
	text = str(score)
