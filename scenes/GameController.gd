extends Node

enum GameState {
	Running,
	Paused,
	Dialogue,
	Cutscene
}

var _state: GameState = GameState.Running;

func start_dialogue(dialogue: PackedStringArray) -> void:
	assert(!dialogue.is_empty());

	_state = GameState.Dialogue;

	for line in dialogue:
		print(line);

	_state = GameState.Running;
