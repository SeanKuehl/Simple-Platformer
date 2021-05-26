extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#res://SecondLevelFolder/LevelTwo.tscn
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "collision")


func collision(entity):
	if entity.is_in_group("Player"):
		get_tree().change_scene("res://SecondLevelFolder/LevelTwo.tscn")
