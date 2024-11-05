extends Resource

class_name NpcData;

@export var name: String;
@export var Sprite: Texture2D;
@export_file('*.txt') var Dialogue_Path: String;

func DialogArray() -> Array[String]:
	return Dialogue_Path.split("\n");
