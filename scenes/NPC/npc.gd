extends CharacterBody2D


class_name NPC;

const open_dialog_sound = preload("res://assets/audio/pepSound3.ogg");
const close_dialog_sound = preload("res://assets/audio/pepSound1.ogg");


@export var Metadata: NpcData;
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var DialogueBox: Sprite2D = $DialogueBox
@onready var sprite: Sprite2D = $Sprite2D


@export var SPEED = 300.0

var dialogue_option: bool = false;

func _ready() -> void:
	sprite.texture = Metadata.Sprite;

func open_dialogue_option(_other: Area2D) -> void:
	dialogue_option = true;
	audio_stream_player_2d.stop();
	audio_stream_player_2d.stream = open_dialog_sound;
	audio_stream_player_2d.play();
	DialogueBox.set_visible(true);
	pass;

func close_dialogue_option(_other: Area2D) -> void:
	dialogue_option = false;
	audio_stream_player_2d.stop();
	audio_stream_player_2d.stream = close_dialog_sound;
	audio_stream_player_2d.play();
	DialogueBox.set_visible(false);
	pass;


func _on_player_interact() -> void:
	if dialogue_option:
		Metadata.OpenDialogue();
		GameController.start_dialogue(Metadata.DialogArray());
