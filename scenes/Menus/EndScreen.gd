extends PanelContainer


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Guess"):
		GameController.state = GameController.GameState.Running;
		get_tree().change_scene_to_file("res://scenes/game/game.tscn")
	elif Input.is_action_just_pressed("Cancel"):
		get_tree().quit();
