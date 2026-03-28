extends CharacterBody2D

@export var speed := 500

signal laser(position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	listen_to_input(delta)

# Handle player input for movement
func listen_to_input(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# shooting input
	if Input.is_action_just_pressed("shoot"):
		laser.emit(position)
	
