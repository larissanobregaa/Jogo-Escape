extends CharacterBody2D  # Certifique-se de que o nó do personagem use CharacterBody2D

@export var speed : float = 200.0  # Velocidade do personagem

func _process(delta: float) -> void:
	var direction = Vector2.ZERO  # Inicia sem movimento

	# Captura os inputs do jogador
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normaliza o vetor de direção para evitar que ele se mova mais rápido na diagonal
	direction = direction.normalized()

	# Move o personagem com base na direção e velocidade
	velocity = direction * speed
	move_and_slide()
