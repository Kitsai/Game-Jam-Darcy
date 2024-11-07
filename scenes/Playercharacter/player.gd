extends CharacterBody2D

class_name PlayerCharacter;

signal interact;

@export var SPEED = 300.0
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D;
@onready var park_dialogue: TextureRect = $ParkDialogue

enum Facing {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	NONE
}

var face_direction: Facing = Facing.DOWN;

const JUMP_VELOCITY = -400.0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		interact.emit();

func get_facing_direction(direction: Vector2) -> Facing:
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				return Facing.RIGHT;
			return Facing.LEFT;
		else:
			if direction.y > 0:
				return Facing.DOWN;
			return Facing.UP;
	return Facing.NONE;

func _physics_process(_delta: float) -> void:
	if GameController.state != GameController.GameState.Running:
		return
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized();

	var current_direction = get_facing_direction(direction);

	match current_direction:
		Facing.UP:
			animation.play("Walk_back");
		Facing.DOWN:
			animation.play("Walk_default");
		Facing.LEFT:
			animation.play("Walk_side");
			animation.flip_h = false;
		Facing.RIGHT:
			animation.play("Walk_side");
			animation.flip_h = true;
		Facing.NONE:
			match face_direction:
				Facing.UP:
					animation.play("Back");
				Facing.DOWN:
					animation.play("default");
				Facing.LEFT:
					animation.play("Side");
				Facing.RIGHT:
					animation.play("Side");

	face_direction = current_direction;

	velocity = direction * SPEED;

	move_and_slide();


func _on_map_park_dialogue_on() -> void:
	park_dialogue.set_visible(true);


func _on_map_park_dialogue_off() -> void:
	park_dialogue.set_visible(false);
