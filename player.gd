extends CharacterBody2D

@export var speed := 500
var can_shoot: bool = true

signal laser(position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)
	$PlayerImage.texture = load("res://Foozle_2DS0011_Void_MainShip/Main Ship/Main Ship - Bases/PNGs/Main Ship - Base - Full health.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	listen_to_input(delta)

# Handle player input for movement
func listen_to_input(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# shooting input
	if Input.is_action_just_pressed("shoot") and can_shoot == true:
		laser.emit($LaserStartPosition.global_position) # Emit the laser signal with the position of the laser (adjusted to be above the player)
		can_shoot = false
		$LaserTimer.start()


func _on_laser_timer_timeout() -> void:
	can_shoot = true
	


func _on_level_health_changed(new_health: Variant) -> void:
	if new_health <= 2:
		$PlayerImage.texture = load("res://Foozle_2DS0011_Void_MainShip/Main Ship/Main Ship - Bases/PNGs/Main Ship - Base - Slight damage.png")
	elif new_health <= 1:
		$PlayerImage.texture = load("res://Foozle_2DS0011_Void_MainShip/Main Ship/Main Ship - Bases/PNGs/Main Ship - Base - Very damaged.png")