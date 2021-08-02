extends Area2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var pista = true
export var tiempo_pista = 2
# ---------------- SEÑALES    ---------------
signal verPuzzle;
# ---------------- FUNCION READY
func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()
# ---------------- FUNCION QUE EMITE LA SEÑAL PARA VISUALIZAR EL PUZZLE ASOCIADO
func ver_elemento():
	emit_signal("verPuzzle")
# ---------------- MENEJADOR SEÑAL -> TIEMPO DE ESPERA PISTA
func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")
# ---------------- MENEJADOR SEÑAL -> ENTRA PLAYER AL AREA
func _on_Panel_body_entered(body):
	body.elemento = self
# ---------------- MENEJADOR SEÑAL -> SALE PLAYER DEL AREA
func _on_Panel_body_exited(body):
	body.elemento = null
