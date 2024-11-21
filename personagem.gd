extends CharacterBody2D

var grav = 10
var speed = 300
var som_lava: AudioStreamPlayer
var morreu: bool = false  # Controle para evitar múltiplos disparos

func _ready():
	# Cria o player de som e adiciona à cena
	som_lava = AudioStreamPlayer.new()
	add_child(som_lava)
	# Carrega o arquivo de som para o player
	som_lava.stream = load("res://Musica/musica lava.mp3")
	som_lava.volume_db = -10  # Ajusta o volume
	som_lava.pitch_scale = 2.62  # Acelera a reprodução da música

func _process(_delta):
	if morreu:
		return  # Bloqueia movimentação após a morte

	if !is_on_floor():
		velocity.y += grav

	# Se morreu, não permite movimentação
	if !morreu:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
		else:
			velocity.x = 0

		if is_on_floor() and Input.is_action_just_pressed("ui_up"):
			velocity.y -= 400

		if velocity.x != 0 and is_on_floor():
			$AnimatedSprite2D.play("run")
		elif is_on_floor():
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("mid air")

		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = false

	move_and_slide()

func _physics_process(_delta):
	if morreu:
		return  # Evita múltiplos disparos enquanto a cena recarrega

	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Lava":
			if !morreu:  # Previne execução múltipla se já morreu
				morreu = true  # Marca como morto
				som_lava.play()  # Toca a música imediatamente

				# Calcula o tempo necessário para tocar a música acelerada
				var tempo_reproducao = som_lava.stream.get_length() / som_lava.pitch_scale

				# Para a movimentação do personagem imediatamente
				velocity = Vector2.ZERO  # Define a velocidade do personagem como zero

				# Reinicia a cena após o tempo calculado
				get_tree().create_timer(tempo_reproducao).timeout.connect(_on_timeout)
			break

func _on_timeout():
	get_tree().change_scene_to_file("res://game_over.tscn") # Reinicia a cena
