extends Node2D
# ---------------- VARIABLES    ---------------
var ranuras
var cartas
var visible_ui = false
# ---------------- SEÑALES    ---------------
signal completado
signal cerrado
# ---------------- FUNCION READY
func _ready():
	modulate    = Color(1,1,1,0)
	ranuras = $Ranuras.get_children()
	cartas  = $Cartas.get_children()
	for carta in cartas:
		carta.ocultar_Carta()
# ---------------- FUNCION PARA OCULTAR
func ocultar_Puzzle():
	$AnimationPlayer.play("OCULTAR")
# ---------------- FUNCION PARA MOSTRAR
func mostrar_Puzzle():
	if !esta_visible():
		$AnimationPlayer.play("MOSTRAR")
# ---------------- FUNCION PARA VERIFICAR VISIBILIDAD
func esta_visible():
	return visible_ui
# ---------------- MENEJADOR SEÑAL -> RESPUESTA CUANDO UNA RANURA SE ACIERTA CORRECTAMENTE
func _on_Ranura_acertado():
	var ocupados = 0
	for ranura in ranuras:
		if ranura.ocupada:
			ocupados += 1
	if ocupados == ranuras.size():
		emit_signal("completado")
		ocultar_Puzzle()
# ---------------- MENEJADOR SEÑAL -> ORDEN DE VISUALIZAR
func _on_Panel_verPuzzle():
	mostrar_Puzzle()
# ---------------- MENEJADOR SEÑAL -> PRESIONAR BOTON CERRAR
func _on_CloseButton_pressed():
	if esta_visible():
		emit_signal("cerrado")
		ocultar_Puzzle()
# ---------------- MENEJADOR SEÑAL -> FINALIZAR ANIMACION
func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		'MOSTRAR':
			visible_ui = true
		'OCULTAR':
			visible_ui = false
