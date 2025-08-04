extends CharacterBody2D
class_name Ball

var speed : float = 100.0
var ArrayOFStartDirection:Array[Vector2] = [Vector2(1,1),Vector2(-1,1)]
var direction: Vector2
@onready var collide: AudioStreamPlayer = $Collide

func _ready() -> void:
	set_meta("ball",true)
	await get_tree().create_timer(0.5).timeout
	direction = ArrayOFStartDirection[randi_range(0,ArrayOFStartDirection.size()-1)]
	velocity = speed * direction
	
func _physics_process(delta: float) -> void:
	var collide_move = move_and_collide(velocity * delta)
	if collide_move != null :
		collide.play()
		if collide_move.get_collider().has_meta("brick") :
			collide_move.get_collider().touched()
		velocity *= 1.01
		velocity = velocity.bounce(collide_move.get_normal())
