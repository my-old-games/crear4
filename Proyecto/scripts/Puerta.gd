extends Area2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var siguiente_escena = "res://niveles/Nive99.tscn"
# ---------------- FUNCION PARA ABRIR LA PUERTA
func abrir_Puerta():
	$AnimatedSprite.play("ABIERTO")
# ---------------- MENEJADOR SEÑAL -> EL JUGADOR INGRESO A LA PUERTA
func _on_Puerta_body_entered(body):
	if $AnimatedSprite.animation  == "ABIERTO" :
		print("VICTORIA")
		get_tree().change_scene(siguiente_escena)
	else:
		print(body)
