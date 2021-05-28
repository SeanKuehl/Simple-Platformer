extends KinematicBody2D

var speed = 500
var jump_speed = -500
var gravity = 800

var buttonPressed = false
var camDownPressed = false
var camUpPressed = false
var camLeftPressed = false
var camRightPressed = false
var cameraMoveAmount = 200

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("RIGHT"):
		$Sprite/p1_walk08.set_flip_h(false)
		$AnimationPlayer.play("Walk Left")
		
		velocity.x += speed
	if Input.is_action_pressed("LEFT"):
		$Sprite/p1_walk08.set_flip_h(true)
		$AnimationPlayer.play("Walk Left")
		velocity.x -= speed
	#when we're not moving show, don't play the animation
	if velocity.x == 0:
		$AnimationPlayer.play("Idle")
		
	#use CAM_UP, CAM_DOWN, CAM_LEFT, and CAM_RIGHT to "look" or move the camera
	#$Camera2D.position -= transform.x * 10
	if Input.is_action_pressed("CAM_DOWN") and camDownPressed == false and buttonPressed == false:
		#$Camera2D.position += transform.x * 10	#this moves the camera right
		$Camera2D.position += transform.y * cameraMoveAmount
		camDownPressed = true
		buttonPressed = true
	if Input.is_action_just_released("CAM_DOWN") and camDownPressed == true and buttonPressed == true:
		$Camera2D.position -= transform.y * cameraMoveAmount
		camDownPressed = false
		buttonPressed = false
		#if Input.is_action_just_released("click"):
		
	if Input.is_action_pressed("CAM_UP") and camUpPressed == false and buttonPressed == false:
		
		$Camera2D.position -= transform.y * cameraMoveAmount
		camUpPressed = true
		buttonPressed = true
	if Input.is_action_just_released("CAM_UP") and camUpPressed == true and buttonPressed == true:
		$Camera2D.position += transform.y * cameraMoveAmount
		camUpPressed = false
		buttonPressed = false
		
	if Input.is_action_pressed("CAM_LEFT") and camLeftPressed == false and buttonPressed == false:
		$Camera2D.position -= transform.x * cameraMoveAmount
		camLeftPressed = true
		buttonPressed = true
	if Input.is_action_just_released("CAM_LEFT") and camLeftPressed == true and buttonPressed == true:
		$Camera2D.position += transform.x * cameraMoveAmount
		camLeftPressed = false
		buttonPressed = false
		
	if Input.is_action_pressed("CAM_RIGHT") and camRightPressed == false and buttonPressed == false:
		$Camera2D.position += transform.x * cameraMoveAmount
		camRightPressed = true
		buttonPressed = true
	if Input.is_action_just_released("CAM_RIGHT") and camRightPressed == true and buttonPressed == true:
		$Camera2D.position -= transform.x * cameraMoveAmount
		camRightPressed = false
		buttonPressed = false

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("JUMP"):
		if is_on_floor():
			velocity.y = jump_speed
