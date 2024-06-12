extends RichTextLabel

var time_start = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = Vector2(-get_viewport_rect().size / 2)
	text = str($"../../player".position)
