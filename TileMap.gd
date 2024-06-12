extends TileMap

@export var NOISE: NoiseTexture2D
@onready var noise = NOISE.noise

# Called when the node enters the scene tree for the first time.
func _ready():
	noise.seed = randi()

func calcThing(x, s):
	var p = pow(s, x)
	return p / pow(p + 1, 2) * 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var playerPos = $"../player".position
	
	for x in range(playerPos.x/16-20, playerPos.x/16+20):
		for y in range(playerPos.y/16-20, playerPos.y/16+20):
			var dist = Vector2(x*16, y*16).distance_to(playerPos)/16.
			var distto4392709 = Vector2(x*16, y*16).distance_to(Vector2(4096,4096))
			var distjifsdhnlm = calcThing(Vector2(x*16, y*16).distance_to(Vector2(0,0))/16., 1.3)
			var hdaosjfsouidj = calcThing(distto4392709/48., 1.3)
			
			if noise.get_noise_2d(x, y)-distjifsdhnlm-hdaosjfsouidj > 0 and dist < 16:
				set_cell(0, Vector2(x, y), 0, Vector2(floor(15 + randf_range(0,1) * dist / 16 - dist), max(0, 15-distto4392709/128.)))
			else:
				set_cell(0, Vector2(x, y), -1, Vector2(-1, -1))

