extends Area2D


var touch : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.has_meta("ball") and touch == false :
		touch = true
		GlobalInfo.touchroof.emit()
