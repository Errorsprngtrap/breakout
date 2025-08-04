extends Node2D
class_name Main_Game

@export var BallScene : PackedScene
@onready var BrickScene : PackedScene = preload("res://Scene/brick.tscn")
@onready var gameoverscreen : PackedScene = preload("res://Scene/game_over.tscn")
@export var lifeobj : PackedScene
@onready var ball_spawn: Marker2D = $BallSpawn
@onready var brick_spawn: Marker2D = $BrickSpawn

var colums : int = 13
var rows : int = 11
var space : float = 35

var ball : Ball
var ball_instance

func ballspawn() -> void :
	if ball_instance and is_instance_valid(ball_instance):
		ball_instance.queue_free()
	ball_instance = BallScene.instantiate()
	ball_instance.position = ball_spawn.position
	add_child(ball_instance)

func spawnbrick() :
	for r in rows :
		for c in colums :
			var brinck_instance:brick = BrickScene.instantiate()
			var rd = randi_range(0,5)
			if rd == 0 :
				brinck_instance.HP = 3
			elif rd == 1 or rd == 2 :
				brinck_instance.HP = 2
			else :
				brinck_instance.HP = 1
			brick_spawn.add_child(brinck_instance)
			brinck_instance.position = Vector2(space + (r * 48),space - (c * 30))
			GlobalInfo.brick_amount += 1

func _ball_lost():
	GlobalInfo.life -= 1
	GlobalInfo.LifeUpdate.emit()
	if GlobalInfo.life > 0 :
		call_deferred("ballspawn")
	else : 
		if GlobalInfo.score > DataSaver.bestscore :
			DataSaver.bestscore = GlobalInfo.score
			DataSaver.save_data()
			GlobalInfo.bestscoreupdate.emit()
		var game_over_instance = gameoverscreen.instantiate()
		add_child(game_over_instance)
	
func _ready() -> void:
	GlobalInfo.entered.connect(_ball_lost)
	GlobalInfo.lifeobject.connect(_life_fall)
	spawnbrick()
	ballspawn()

func _life_fall(pos):
	var life_up_instance = lifeobj.instantiate()
	add_child(life_up_instance)
	life_up_instance.global_position = pos
