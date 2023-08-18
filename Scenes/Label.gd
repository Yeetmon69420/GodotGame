extends Label
 
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
 
var timePassed = 0;
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not str(int(timePassed)) == text:
		timePassed = 0;
 
	timePassed = timePassed + delta;
 
	text = str(int(timePassed))

