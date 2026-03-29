extends CanvasLayer

static var image = load("res://Heart.png")
var time_elapsed := 0

func _ready() -> void:
	$MarginContainer/Label.text = "0"

func set_health(amount):
	# remove all children
	for child in $HBoxContainer.get_children():
		child.queue_free()

	# create new children and amont is set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$HBoxContainer.add_child(text_rect)
		text_rect.custom_minimum_size = Vector2(100, 100)


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
