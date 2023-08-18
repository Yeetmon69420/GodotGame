extends Area2D

@export var left_limit = 0
@export var right_limit = 0

@onready var vertical_position = position.y
var direction = 1
@export var speed = 50
func _ready():
	pass
	
func _process(delta):
	translate(Vector2.RIGHT * direction * delta * speed)
	$AnimatedSprite2D.play("Walk")
	if direction > 0 :
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		
	if position.x > right_limit:
		direction = -1
	if position.x < left_limit:
		direction = 1
		
		position.y = vertical_position + sin(position.x * 0.1) * 10
