extends CharacterBody2D

# Constantes de movimento
const GRAVITY = 900
const JUMP_FORCE = -500
const MOVE_SPEED = 200
const MAX_FALL_SPEED = 900

# Variáveis de estado
var is_on_ground = false

func _physics_process(delta):
	# Aplicar gravidade
	if not is_on_ground:
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0
	
	# Controle de movimento horizontal
	var input_direction = 0
	if Input.is_action_pressed("ui_right"):
		input_direction += 1
	if Input.is_action_pressed("ui_left"):
		input_direction -= 1

	velocity.x = input_direction * MOVE_SPEED

	# Pulo
	if is_on_ground and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_FORCE

	# Limitar velocidade de queda
	if velocity.y > MAX_FALL_SPEED:
		velocity.y = MAX_FALL_SPEED

	# Movimento final
	move_and_slide()

	is_on_ground = is_on_floor()
