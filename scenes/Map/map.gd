extends Node2D

signal park_dialogue_on;
signal park_dialogue_off;

func _on_area_2d_area_entered(_area: Area2D) -> void:
	park_dialogue_on.emit();


func _on_area_2d_area_exited(_area: Area2D) -> void:
	park_dialogue_off.emit();
