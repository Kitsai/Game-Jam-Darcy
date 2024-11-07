extends Node2D

@export var _dialogue_box_scene: PackedScene;
@onready var _canvas_layer: CanvasLayer = $CanvasLayer;
@onready var chooser: PanelContainer = $CanvasLayer/Chooser
const WIN = preload("res://scenes/Menus/win.tscn")
const LOSE = preload("res://scenes/Menus/Lose.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Guess") && GameController.state == GameController.GameState.Running:
		ChooseGuilty();
	elif Input.is_action_just_pressed("Cancel"):
		get_tree().quit();

func start_dialogue(dialogue: PackedStringArray) -> void:
	assert(!dialogue.is_empty());

	GameController.state = GameController.GameState.Dialogue;

	var dialogue_box: DialogueBox = _dialogue_box_scene.instantiate();
	dialogue_box.dialog_ended.connect(end_dialogue);
	dialogue_box.dialogue = dialogue;
	_canvas_layer.add_child(dialogue_box);

func end_dialogue() -> void:
	GameController.state = GameController.GameState.Running;

func stop_all() -> void:
	for child in get_children():
		child.set_process(false);

func resume_all() -> void:
	for child in get_children():
		child.set_process(true);


func ChooseGuilty() -> void:
	GameController.state = GameController.GameState.Choosing;
	chooser.set_visible(true);

func _on_chosen(right: bool) -> void:
	if right:
		get_tree().change_scene_to_packed(WIN);
	else:
		get_tree().change_scene_to_packed(LOSE);
