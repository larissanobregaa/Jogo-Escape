extends Label

var score = 0000
var som_moeda: AudioStreamPlayer  # Referência ao player de som de moeda

func _ready():
	# Cria o player de som e adiciona à cena
	som_moeda = AudioStreamPlayer.new()
	add_child(som_moeda)

	# Carrega o arquivo de som para o player
	som_moeda.stream = load("res://Musica/collect points.mp3")

	# Conecta o sinal 'moeda_coletada' de cada moeda na cena ao ScoreLabel
	for moeda in get_tree().get_nodes_in_group("Moedas"):
		moeda.connect("moeda_coletada", Callable(self, "_on_moeda_coletada"))

func _on_moeda_coletada():
	score += 1  # Incrementa a pontuação
	text = "Score: " + str(score)

	# Toca o som da moeda
	som_moeda.play()
