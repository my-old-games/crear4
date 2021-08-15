extends Area2D
# ---------------- SEÑALES    ---------------
signal verPuzzle;
# ---------------- FUNCION READY
func _ready():
	$AnimatedSprite.play("IDLE")
# ---------------- FUNCION QUE EMITE LA SEÑAL PARA VISUALIZAR EL PUZZLE ASOCIADO
func ver_elemento():
	emit_signal("verPuzzle")
# ---------------- MENEJADOR SEÑAL -> ENTRA PLAYER AL AREA
func _on_Panel_body_entered(body):
	owner.pista()
	body.elemento = self
# ---------------- MENEJADOR SEÑAL -> SALE PLAYER DEL AREA
func _on_Panel_body_exited(body):
	body.elemento = null
# ---------------- MENEJADOR SEÑAL -> CUANDO EL ROMPECABEZAS ASOCIADO SE COMPLETA
func panel_completado():
	$AnimatedSprite.play("COMPLETADO")
