extends Node

enum GameState {
	Running,
	Paused,
	Dialogue,
	Cutscene
}

var state: GameState = GameState.Running;
