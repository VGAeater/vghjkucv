extends CharacterBody2D

@export var speed = 400.0

func get_input():
	velocity = Input.get_vector("Left", "Right", "Up", "Down") * speed
	
	$AnimatedSprite2D.play('walking' if velocity.length() > 0 else 'standing')
	
	if abs(velocity.x) > 0: 
		$AnimatedSprite2D.flip_h = velocity.x < 0

func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_area_2d_body_entered(body):
	get_tree().quit()
