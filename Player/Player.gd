extends KinematicBody2D

var speed = 500
var jump_speed = -500
var gravity = 800

var buttonPressed = false
var cameraMoveAmount = 200

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("RIGHT"):
		$Sprite/p1_walk08.set_flip_h(false)
		velocity.x += speed
	if Input.is_action_pressed("LEFT"):
		$Sprite/p1_walk08.set_flip_h(true)
		velocity.x -= speed
		
	#use CAM_UP, CAM_DOWN, CAM_LEFT, and CAM_RIGHT to "look" or move the camera
	#$Camera2D.position -= transform.x * 10
	if Input.is_action_pressed("CAM_DOWN") and buttonPressed == false:
		#$Camera2D.position += transform.x * 10	#this moves the camera right
		$Camera2D.position += transform.y * cameraMoveAmount
		buttonPressed = true
	if Input.is_action_just_released("CAM_DOWN"):
		$Camera2D.position -= transform.y * cameraMoveAmount
		buttonPressed = false
		#if Input.is_action_just_released("click"):
		
	if Input.is_action_pressed("CAM_UP") and buttonPressed == false:
		$Camera2D.position -= transform.y * cameraMoveAmount
		buttonPressed = true
	if Input.is_action_just_released("CAM_UP"):
		$Camera2D.position += transform.y * cameraMoveAmount
		buttonPressed = false
		
	if Input.is_action_pressed("CAM_LEFT") and buttonPressed == false:
		$Camera2D.position -= transform.x * cameraMoveAmount
		buttonPressed = true
	if Input.is_action_just_released("CAM_LEFT"):
		$Camera2D.position += transform.x * cameraMoveAmount
		buttonPressed = false
		
	if Input.is_action_pressed("CAM_RIGHT") and buttonPressed == false:
		$Camera2D.position += transform.x * cameraMoveAmount
		buttonPressed = true
	if Input.is_action_just_released("CAM_RIGHT"):
		$Camera2D.position -= transform.x * cameraMoveAmount
		buttonPressed = false

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor():
			velocity.y = jump_speed
