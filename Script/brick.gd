extends StaticBody2D
class_name brick

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var HP : int = 1 ##Brick HP

var MainGame = null
var point : int 

func _ready() -> void:
	MainGame = $"."
	set_meta("brick",true)
	if HP == 3 :
		sprite_2d.modulate = Color(0, 1, 0, 1)
		print("green")
	elif HP == 2 :
		sprite_2d.modulate = Color(1, 1, 0, 1)
		print("yellow")
	else : 
		sprite_2d.modulate = Color(1, 0, 0, 1)
		print("red")

func touched() -> void :
	HP -= 1
	if HP <= 0 :
		GlobalInfo.score += 100
		GlobalInfo.brick_amount -= 1
		GlobalInfo.scoreUpdate.emit()
		if randi_range(0,15) == 0 :
			print('up')
			GlobalInfo.lifeobject.emit(global_position)
		queue_free()
