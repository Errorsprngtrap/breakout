extends Control
class_name game_over_screen

@onready var score: Label = $Score
@onready var bestscore: Label = $Bestscore
@onready var restart: Button = $restart

func _ready() -> void:
	score.text = str(GlobalInfo.score)
	bestscore.text = str(DataSaver.bestscore)	

func _on_restart_pressed() -> void:
	GlobalInfo.life = 3
	GlobalInfo.score = 0
	GlobalInfo.brick_amount = 0
	get_tree().reload_current_scene()
