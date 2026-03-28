extends Area2D

# Meteor speed variables
var meteor_speed := 400
@export var max_speed := 700
@export var min_speed := 300

func _ready() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new() # Create a new random number generator
	var texture = rng.randi_range(1, 2) # Randomly select a texture for the meteor
	var rand_speed = rng.randi_range(min_speed, max_speed) # Randomly select a speed for the meteor within the specified range
	meteor_speed = rand_speed
	if texture == 1:
		$Sprite2D.texture = preload("res://space_background_pack/Assets/Blue Version/layered/asteroid-1.png")
	else:
		$Sprite2D.texture = preload("res://space_background_pack/Assets/Blue Version/layered/asteroid-2.png")

	# start position
	var width = get_viewport().get_visible_rect().size[0] # Get the width of the viewport
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)

func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * meteor_speed * delta 

func _on_body_entered(body: Node2D) -> void:
	print('body entered')
	print(body)
