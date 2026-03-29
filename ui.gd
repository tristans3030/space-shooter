extends CanvasLayer

static var image = load("res://heart.png")

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
