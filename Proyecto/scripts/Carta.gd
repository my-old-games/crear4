extends KinematicBody2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var palabra = "SI"
# ---------------- FUNCION PARA OCULTAR
func ocultar_Carta():
	$AnimationPlayer.play("OCULTAR")
# ---------------- FUNCION PARA MOSTRAR
func mostrar_Carta():
	$AnimationPlayer.play("MOSTRAR")
# ---------------- MENEJADOR SEÑAL -> RANURA OCUPADA
func _on_Ranura_acertado():
	ocultar_Carta()

func animar_avatar():
	$Avatar.play('IDLE')
