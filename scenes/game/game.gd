extends Node2D

@export var _dialogue_box_scene: PackedScene;
@onready var _canvas_layer: CanvasLayer = $CanvasLayer;

func start_dialogue(dialogue: PackedStringArray) -> void:
	assert(!dialogue.is_empty());

	GameController.state = GameController.GameState.Dialogue;

	var dialogue_box: DialogueBox = _dialogue_box_scene.instantiate();
	dialogue_box.dialog_ended.connect(end_dialogue);
	dialogue_box.dialogue = dialogue;
	_canvas_layer.add_child(dialogue_box);

func end_dialogue() -> void:
	GameController.state = GameController.GameState.Running;
