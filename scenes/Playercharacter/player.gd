extends CharacterBody2D

class_name player_character;

@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized();

	velocity = direction * SPEED;

	move_and_slide();

