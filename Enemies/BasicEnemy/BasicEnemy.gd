extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravityEffect = 400
var goingLeft = true

#add player as exception so that the snail doesn't turn around when it
#sees the player



var velocity = Vector2.ZERO

func _ready():
	
	get_node("Area").connect("body_entered", self, "collision")

func collision(entity):
	#when we hit the player, send the game over what level we're on and then
	#switch to it
	
	if entity.is_in_group("Player"):
		var thisLevel = get_tree().current_scene.filename
		Global.currentLevel = thisLevel
		get_tree().change_scene("res://GameOver/GameOverScene.tscn")
		entity.queue_free()
		#call the game over thing
		
		

func _physics_process(delta):
	velocity.x = 0
	
	
	
	if goingLeft == true:
		if $LeftEdge.is_colliding():
			
			velocity.x -= speed
			velocity.y += gravityEffect * delta
			velocity = move_and_slide(velocity, Vector2.UP)
			
			var collision = $LeftHit.is_colliding()	#this collision is for blocks right in front of them
			var collider = $LeftHit.get_collider()
			if collision and not collider.is_in_group("Player"):
				
				speed = speed *-1
				goingLeft = false
				
				#velocity.y = 0
				velocity.x -= speed
				#$Sprite.set_flip_h(false)
				$Sprite/snailWalk1.set_flip_h(true)
				#velocity.y += gravity * delta
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
			
			velocity.x -= speed
			velocity.y += gravityEffect * delta
			velocity = move_and_slide(velocity, Vector2.UP)
			
			var collision = $RightHit.is_colliding()
			var collider = $RightHit.get_collider()
			if collision and not collider.is_in_group("Player"):
				
				speed = speed *-1
				goingLeft = true
				$Sprite/snailWalk1.set_flip_h(false)
			#	velocity.y = 0
				velocity.x += speed
			
				velocity.y += gravityEffect * delta
				velocity = move_and_slide(velocity, Vector2.UP)
		
		else:
			
			speed = speed *-1
			goingLeft = true
			$Sprite/snailWalk1.set_flip_h(false)
		#	velocity.y = 0
			velocity.x += speed
		
			velocity.y += gravityEffect * delta
			velocity = move_and_slide(velocity, Vector2.UP)
	
		
		
		
