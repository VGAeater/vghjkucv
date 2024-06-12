extends Node2D

@export var spawn_scene: PackedScene

func spawn(_spawn_scene := spawn_scene) -> void:
	var spawn := _spawn_scene.instantiate() as AnimatedSprite2D
	
	var viewport = get_viewport_rect().size
	var playerPos = $"../player".position
	spawn.position = Vector2((playerPos.x+randi_range(-viewport.x/2, viewport.x/2)), (playerPos.y+randi_range(-viewport.y/2, viewport.y/2)))
	
	add_child(spawn)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if randf_range(0, 1) < 0.005:
		spawn(spawn_scene);
