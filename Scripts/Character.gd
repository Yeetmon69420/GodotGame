extends CharacterBody2D

@export var speed = 30
@export var jump_velocity = -400
@export var max_speed = 300
@export var friction = 10

var dead

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animator = $AnimationPlayer

func _physics_process(delta):
	print($AnimationPlayer.current_animation,$AnimatedSprite2D.animation)
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input .is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and is_on_floor():

		animator.play("Run")
		velocity.x =  move_toward(velocity.x, direction * max_speed, speed)
	elif not is_on_floor():

		animator.play("Jump")
		velocity.x =  move_toward(velocity.x, direction * max_speed, speed)
	else:

		animator.play("Idle")
		velocity.x = move_toward(velocity.x, 0, friction)
	#change direction
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	move_and_slide() 
	

	if position.y > 600:
		position = Vector2(380, 30);

func _on_hitbox_area_entered(area):
	if area.is_in_group("Death"):
		dead = true
		$AnimatedSprite2D.play("Death")
		$Timer.start()





func _on_timer_timeout():
	get_tree().reload_current_scene()
