extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
var goingLeft = true

var velocity = Vector2.ZERO



func _physics_process(delta):
	velocity.x = 0
	
	if goingLeft == true:
		if $LeftEdge.is_colliding():
			velocity.x -= speed
			velocity.y += gravity * delta
			velocity = move_and_slide(velocity, Vector2.UP)
		
		else:
			speed = speed *-1
			goingLeft = false
			
			#velocity.y = 0
			velocity.x -= speed
			#$Sprite.set_flip_h(false)
			$Sprite/snailWalk1.set_flip_h(true)
			#velocity.y += gravity * delta
			velocity = move_and_slide(velocity, Vector2.UP)
	elif goingLeft == false:
		
		if $RightEdge.is_colliding():
			print("here")
			velocity.x -= speed
			velocity.y += gravity * delta
			velocity = move_and_slide(velocity, Vector2.UP)
		
		else:
			
			speed = speed *-1
			goingLeft = true
			$Sprite/snailWalk1.set_flip_h(false)
		#	velocity.y = 0
			velocity.x += speed
		
			velocity.y += gravity * delta
			velocity = move_and_slide(velocity, Vector2.UP)
	
		
		
		
