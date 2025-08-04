extends Area2D
class_name floor

func _on_body_entered(body: Node2D) -> void:
	if body.has_meta("ball") :
		GlobalInfo.entered.emit()
