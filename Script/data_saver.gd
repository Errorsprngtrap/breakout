extends Node
class_name Gamedata

@export var bestscore : int = 0
const Save_File = "user://save_score.tres"
var data = {}

func _ready() -> void:
	load_data()

func save_data():
	var file = FileAccess.open(Save_File,FileAccess.WRITE)
	data = {
		"bestscore" = bestscore
	}
	file.store_var(data)
	file = null
		
func load_data():
	if not FileAccess.file_exists(Save_File):
		data = {
			"bestscore" = 0
		}
		save_data()
	var file = FileAccess.open(Save_File,FileAccess.READ)
	data = file.get_var()
	bestscore = data.bestscore
	file = null
