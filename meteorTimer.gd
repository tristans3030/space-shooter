extends Timer


func _on_timeout() -> void:
	var meteor = Load("res://meteor.tscn").instantiate()
