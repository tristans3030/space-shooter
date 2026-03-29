extends Area2D

@export var speed := 500
@export var anim_speed := 0.25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D, "scale", Vector2(1,1), anim_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta
