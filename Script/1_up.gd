extends Area2D
class_name life_up


var spd : float = 50.0
func _on_body_entered(body: Node2D) -> void:
	if body.has_meta("player") :
		GlobalInfo.life += 1
		GlobalInfo.LifeUpdate.emit()
		queue_free()
		
func _physics_process(delta: float) -> void:
	position.y += spd * delta
