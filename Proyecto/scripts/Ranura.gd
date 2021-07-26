extends Area2D

export var palabra = "SI"
var ocupada = false
signal acertado;

func _on_Ranura_body_entered(body):
	if !ocupada:
		if palabra == body.palabra:
			body.acertada = true
			body.global_position = self.global_position
			ocupada = true
			emit_signal("acertado")
			$AnimatedSprite.play("OCUPADA")
			body.animar_acierto()
		else:
			body._set_drag_pc()
			body.animar_error()
