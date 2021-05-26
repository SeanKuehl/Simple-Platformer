extends KinematicBody2D

var speed = 500
var jump_speed = -500
var gravity = 800

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("RIGHT"):
		$Sprite/p1_walk08.set_flip_h(false)
		velocity.x += speed
	if Input.is_action_pressed("LEFT"):
		$Sprite/p1_walk08.set_flip_h(true)
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor():
			velocity.y = jump_speed
