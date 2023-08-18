extends Node2D
@export var speed = 0.5

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += speed * delta
