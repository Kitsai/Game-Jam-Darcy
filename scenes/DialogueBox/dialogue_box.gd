extends TextureRect

class_name DialogueBox;

signal dialog_ended;

var dialogue: PackedStringArray;
var idx: int = 0;
@onready var label: Label = $Label;
@onready var timer: Timer = $Timer;

func _ready() -> void:
	print("spawned");
	label.text = dialogue[idx];
	print(dialogue[idx])
	timer.start();

	

func _process(_delta: float) -> void:
	if timer.is_stopped() && Input.is_anything_pressed():
		idx += 1;
		if idx >= dialogue.size():
			dialog_ended.emit();
			queue_free();
			print("freed");
			return;
		label.text = dialogue[idx];
		timer.start();
		print(dialogue[idx]);
