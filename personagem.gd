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
		
	if velocity.x > 0 and is_on_floor():
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide()
