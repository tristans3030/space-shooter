extends Area2D

# Meteor speed variables
var meteor_speed: int
var rotation_speed
var direction_x: float
@export var max_speed := 700
@export var min_speed := 300

signal collision

func _ready() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new() # Create a new random number generator
	var texture = rng.randi_range(1, 2) # Randomly select a texture for the meteor
	var rand_speed = rng.randi_range(min_speed, max_speed) # Randomly select a speed for the meteor within the specified range
	rotation_speed = rng.randf_range(1.0, 5.0) # Set rotation speed based on the meteor speed
	meteor_speed = rand_speed # set meteor speed to the randomly generated speed
	direction_x = rng.randf_range(-1, 1) # Randomly select a horizontal direction for the meteor

	# Load textures
	if texture == 1:
		$Sprite2D.texture = preload("res://space_background_pack/Assets/Blue Version/layered/asteroid-1.png")
	else:
		$Sprite2D.texture = preload("res://space_background_pack/Assets/Blue Version/layered/asteroid-2.png")

	# start position
	var width = get_viewport().get_visible_rect().size[0] # Get the width of the viewport
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y) # set starting position of meteor
	

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * meteor_speed * delta # Move the meteor downwards with the specified speed and direction
	rotation += rotation_speed * delta # Rotate the meteor based on the rotation speed

# detect collisions
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
