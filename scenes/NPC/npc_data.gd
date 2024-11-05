extends Resource

class_name NpcData;

@export var name: String;
@export var Sprite: Texture2D;
@export_file('*.txt') var Dialogue_Path: String;

var Dialogue_Open: bool = false;
var Dialogue: FileAccess;

func OpenDialogue() -> void:
	Dialogue = FileAccess.open(Dialogue_Path, FileAccess.READ);

func CloseDialogueFile() -> void:
	Dialogue.close();

func DialogArray() -> PackedStringArray:
	assert(Dialogue.is_open());

	var res: Array[String] = [];

	while !Dialogue.eof_reached():
		res.append(Dialogue.get_line());

	return PackedStringArray(res);
