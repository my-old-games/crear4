extends Area2D

export var palabra = "SI"
var ocupada = false
signal acertado;

func _on_Ranura_body_entered(body):
	print(body.palabra)
	print(palabra)
	if palabra == body.palabra:
		body.pick = false
		body.position = position
		ocupada = true
		emit_signal("acertado")
