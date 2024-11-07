extends PanelContainer

signal chosen(right: bool);

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Cancel"):
		GameController.state = GameController.GameState.Running;
		set_visible(false);

func _bob_chosen() -> void:
	chosen.emit(false);


func _on_hannah_chosen() -> void:
	chosen.emit(true);


func _on_Rocha_chosen() -> void:
	chosen.emit(false);
