extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene("res://FirstLevelFolder/LevelOne.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://MainMenuFolder/CreditsFolder/Credits.tscn")
	


func _on_Controls_pressed():
	get_tree().change_scene("res://MainMenuFolder/ControlsFolder/Controls.tscn")


func _on_Quit_pressed():
	get_tree().quit()
