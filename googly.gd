extends RigidBody2D

@export var startSpeed = 100

var speed = 0
var direction = 0
var time_start = 0

func _ready():
	time_start = Time.get_ticks_msec()

func pointToPlayer(state):
	var spawnAngle = randf_range(0, PI * 2)
	var mag = (get_viewport_rect().size / 2).length() + randi_range(0, 100)
	state.transform.origin = $"../../player".position + Vector2(cos(spawnAngle), sin(spawnAngle)) * mag
	direction = spawnAngle + PI

func _integrate_forces(state):
	if (get_viewport_rect().size / 2).length() + 100 < $"../../player".position.distance_to(position):
		pointToPlayer(state)

func _physics_process(_delta):
	speed = startSpeed + (Time.get_ticks_msec() - time_start) / 100.
	
	linear_velocity = Vector2(cos(direction), sin(direction)) * speed
	
	$AnimatedSprite2D.play('walking' if linear_velocity.length() > 0 else 'standing')
	
	if abs(linear_velocity.x) > 0: 
		$AnimatedSprite2D.flip_h = linear_velocity.x < 0
