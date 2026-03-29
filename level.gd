extends Node2D

# load meteor_scene
var meteor_scene: PackedScene = load("res://meteor.tscn")
var laser_scene: PackedScene = load("res://laser.tscn")

func _ready() -> void:
	# stars
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children():
		# position
		var random_x = rng.randi_range(0, size.x)
		var random_y = rng.randi_range(0, size.y)
		star.position = Vector2(random_x, random_y)

		# scale
		var random_scale = rng.randf_range(-1, -0.5)
		star.scale = Vector2(random_scale, random_scale)

		# anim speed
		star.speed_scale = rng.randf_range(0.6, 1.4)

func _on_meteor_timer_timeout() -> void:
	# instantiate meteor scene
	var meteor = meteor_scene.instantiate()
	# add child to meteor node tree
	$Meteors.add_child(meteor)

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
