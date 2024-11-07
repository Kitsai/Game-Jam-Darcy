extends Panel

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var _is_visible: bool = true;

func _toggle_visibility() -> void:
	_is_visible = !_is_visible;
	label.set_visible(_is_visible);
	timer.start();

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Next"):
		GameController.state = GameController.GameState.Running;
		queue_free();
