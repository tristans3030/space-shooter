extends Control

var level_scene: PackedScene = load("res://level.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = "Score: " + str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
