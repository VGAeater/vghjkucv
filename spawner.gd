extends Node2D

@export var spawn_scene: PackedScene

func spawn(_spawn_scene := spawn_scene) -> void:
	var new_child := _spawn_scene.instantiate() as RigidBody2D
	
	add_child(new_child)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0):
		spawn(spawn_scene);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
