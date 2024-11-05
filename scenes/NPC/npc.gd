extends CharacterBody2D


class_name NPC;

const open_dialog_sound = preload("res://assets/audio/pepSound3.ogg");
const close_dialog_sound = preload("res://assets/audio/pepSound1.ogg");

signal npc_interact;


@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


@export var SPEED = 300.0

var dialogue_open: bool = false;

func open_dialogue_option(other: Area2D) -> void:
	dialogue_open = true;
	audio_stream_player_2d.stop();
	audio_stream_player_2d.stream = open_dialog_sound;
	audio_stream_player_2d.play();
	print("dialogue open");
	pass;

func close_dialogue_option(other: Area2D) -> void:
	dialogue_open = false;
	audio_stream_player_2d.stop();
	audio_stream_player_2d.stream = close_dialog_sound;
	audio_stream_player_2d.play();
	print("dialogue closed");
	pass;
