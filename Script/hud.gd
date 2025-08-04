extends Control
class_name hud

@onready var life: Label = $Life
@onready var score: Label = $Score
@onready var best: Label = $Best

func _ready() -> void:
	GlobalInfo.scoreUpdate.connect(_on_score_update)
	GlobalInfo.LifeUpdate.connect(_on_life_update)
	GlobalInfo.bestscoreupdate.connect(_on_bestscore_update)
	life.text = str(GlobalInfo.life)
	score.text = str(GlobalInfo.score)
	best.text = str(DataSaver.bestscore)

func _on_score_update():
	score.text = str(GlobalInfo.score)

func _on_life_update():
	life.text = str(GlobalInfo.life)

func _on_bestscore_update() :
	best.text = str(DataSaver.bestscore)
