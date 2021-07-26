extends KinematicBody2D

export var palabra = "SI"

func ocultar_Carta():
	$AnimationPlayer.play("OCULTAR")

func mostrar_Carta():
	$AnimationPlayer.play("MOSTRAR")

func _on_Ranura_acertado():
	self.ocultar_Carta()
