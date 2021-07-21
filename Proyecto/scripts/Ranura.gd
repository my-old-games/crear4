extends Area2D

export var palabra = "SI"
var ocupada = false
signal acertado;

func _on_Ranura_body_entered(body):
	if palabra == body.palabra:
		body.pick = false
		body.global_position = self.global_position
		ocupada = true
		emit_signal("acertado")
		$AnimatedSprite.play("OCUPADA")
	else:
		body._set_drag_pc()
		body.global_position = body.init_pos
