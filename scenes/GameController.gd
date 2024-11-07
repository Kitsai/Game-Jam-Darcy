extends Node

enum GameState {
	Running,
	Start,
	Dialogue,
	Choosing,
	Cutscene
}
const CHOOSE_GUILTY = preload("res://scenes/ChooseGuilty/choose_guilty.tscn");

var state: GameState = GameState.Start
