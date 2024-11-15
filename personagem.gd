extends CharacterBody2D

var grav = 10
var speed = 300

func _process(delta):
	if !is_on_floor():
		velocity.y += grav
		
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

func _physics_process(delta):
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == 'Lava' and get_tree():
			get_tree().reload_current_scene()
