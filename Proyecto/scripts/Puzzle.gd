extends Node2D

var ranuras
var cartas
var visible_ui = false

signal completado

func _ready():
	modulate    = Color(1,1,1,0)
	ranuras = $Ranuras.get_children()
	cartas  = $Cartas.get_children()
	for carta in cartas:
		carta.ocultar_Carta()

func ocultar_Puzzle():
	$AnimationPlayer.play("OCULTAR")

func mostrar_Puzzle():
	if !esta_visible():
		$AnimationPlayer.play("MOSTRAR")

func _on_Ranura_acertado():
	var ocupados = 0
	for ranura in ranuras:
		if ranura.ocupada:
			ocupados += 1
	if ocupados == ranuras.size():
		emit_signal("completado")
		ocultar_Puzzle()

func _on_Panel_verPuzzle():
	mostrar_Puzzle()

func esta_visible():
	return visible_ui

func _on_CloseButton_pressed():
	if esta_visible():
		ocultar_Puzzle()

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		'MOSTRAR':
			visible_ui = true
		'OCULTAR':
			visible_ui = false
