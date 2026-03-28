extends Node2D

# load meteor_scene
var meteor_scene: PackedScene = load("res://meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# instantiate meteor scene
	var meteor = meteor_scene.instantiate()
	# add child to meteor node tree
	$Meteors.add_child(meteor)