extends Area2D
# ---------------- FUNCION PARA ABRIR LA PUERTA
func abrir_Puerta():
	$AnimatedSprite.play("ABIERTO")
# ---------------- MENEJADOR SEÑAL -> EL JUGADOR INGRESO A LA PUERTA
func _on_Puerta_body_entered(body):
	if $AnimatedSprite.animation  == "ABIERTO" :
		print("VICTORIA")
	else:
		print(body)
