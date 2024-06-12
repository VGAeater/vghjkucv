extends AnimatedSprite2D

var start


# Called when the node enters the scene tree for the first time.
func _ready():
	start = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Time.get_ticks_msec() - 2000 > start:
		queue_free()
