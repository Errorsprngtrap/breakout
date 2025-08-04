extends Node
class_name Global_Info

var score : int = 0
var life : int = 3
var brick_amount : int = 0

signal entered()
signal scoreUpdate()
signal bestscoreupdate()
signal LifeUpdate()
signal touchroof()
signal lifeobject(pos:Vector2)
