extends Node2D

# load meteor_scene
var meteor_scene: PackedScene = load("res://meteor.tscn")
var laser_scene: PackedScene = load("res://laser.tscn")

func _on_meteor_timer_timeout() -> void:
	# instantiate meteor scene
	var meteor = meteor_scene.instantiate()
	# add child to meteor node tree
	$Meteors.add_child(meteor)

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
