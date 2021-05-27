extends Area2D




func _ready():
	connect("body_entered", self, "collision")

func collision(entity):
	#when we hit the player, send the game over what level we're on and then
	#switch to it
	
	if entity.is_in_group("Player"):
		var thisLevel = get_tree().current_scene.filename
		Global.currentLevel = thisLevel
		get_tree().change_scene("res://GameOver/GameOverScene.tscn")
		entity.queue_free()
		#call the game over thing
		
		
