extends CharacterBody2D
class_name Paddle_Player

const SPEED : float = 5.0
var direction

func _ready() -> void:
	set_meta("player",true)
	GlobalInfo.touchroof.connect(_on_roof_touch)

func _on_roof_touch() :
	scale = scale/2
	
func _physics_process(_adelta: float) -> void:

	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_collide(velocity)
