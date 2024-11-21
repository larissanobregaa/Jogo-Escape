extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Conectar o sinal de pressionar o botão ao método _on_pressed
	self.pressed.connect(_on_pressed)

# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	var next_scene = "res://fase_2.tscn"  # Altere para o caminho correto
	var scene = load(next_scene)
	
	if scene:  # Verifica se a cena foi carregada corretamente
		get_tree().change_scene_to_file(next_scene)  # Muda para a próxima cena
	else:
		print("Erro ao carregar a cena: ", next_scene)
