extends Node2D
# ---------------- FUNCION PARA ABRIR EL PIN
func abrir_Pin():
	$AnimatedSprite.play("ABIERTO")
# ---------------- FUNCION PARA CERRAR EL PIN
func cerrar_Pin():
	$AnimatedSprite.play("CERRADO")
# ---------------- FUNCION PARA VERIFICAR SI EL PIN ESTA ABIERTO
func esta_abierto():
	return $AnimatedSprite.animation  == "ABIERTO"
# ---------------- MENEJADOR SEÑAL -> SE COMPLETO UN PUZZLE
func _on_Puzzle_completado():
	self.abrir_Pin()


