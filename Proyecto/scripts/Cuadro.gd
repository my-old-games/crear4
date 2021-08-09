extends Node2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var pista = true
export var tiempo_pista = 2
# ---------------- SEÑALES    ---------------
signal verCuadro;
# ---------------- FUNCION READY
func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()
# ---------------- FUNCION QUE EMITE LA SEÑAL PARA VISUALIZAR EL CUADRO EN LA UI
func ver_elemento():
	emit_signal("verCuadro", $Pintura.get_texture(), $Pintura.get_global_scale())
# ---------------- MENEJADOR SEÑAL -> TIEMPO DE ESPERA PISTA
func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")
# ---------------- MENEJADOR SEÑAL -> ENTRA PLAYER AL AREA
func _on_Cuadro_body_entered(body):
	owner.pista()
	body.elemento = self
# ---------------- MENEJADOR SEÑAL -> SALE PLAYER DEL AREA
func _on_Cuadro_body_exited(body):
	body.elemento = null
