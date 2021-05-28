extends KinematicBody2D

var speed = 120
var jump_speed = -180
var gravityEffect = 400

var goingDown = true
var waitTimer = 0.0
var waitTimerIncrement = 1.0
var waitTimerThreshold = 100.0

var velocity = Vector2.ZERO

func _ready():
	get_node("Area2D").connect("body_entered", self, "collision")

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
	
	
	
	if goingDown == true:
		
		velocity.y += speed * delta
		velocity = move_and_slide(velocity, Vector2.UP)
			
		var collision = move_and_collide(velocity * delta)	
		if collision:
			
			waitTimer += waitTimerIncrement
			
			if waitTimer >= waitTimerThreshold:
				
				
				speed = speed *-1
				goingDown = false
					
				velocity.y = 0
				
				#there are no good clean wait functions in godot currently,
				#so I made my own
				
				#this makes the fly collide with a block and then wait
				#while waitTimer < 100000.0:
					#waitTimer += 0.1
				waitTimer = 0.0
			
	elif goingDown == false:
		velocity.y += speed * delta
		velocity = move_and_slide(velocity, Vector2.UP)
			
		var collision = move_and_collide(velocity * delta)	
		if collision:
			waitTimer += waitTimerIncrement
			
			if waitTimer >= waitTimerThreshold:
				
				speed = speed *-1
				goingDown = true
					
				velocity.y = 0
				
				#there are no good clean wait functions in godot currently,
				#so I made my own
				
				#this makes the fly collide with a block and then wait
				#while waitTimer < 100000.0:
				#	waitTimer += 0.1
				waitTimer = 0.0
			
			
		
	
	
		
		
		
