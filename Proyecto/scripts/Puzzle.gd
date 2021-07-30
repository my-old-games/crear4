extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ranuras
var cartas
var visible_ui

signal completado

const  INIT_POSITION = Vector2(600,-400)

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate    = Color(1,1,1,0)
	ranuras = $Ranuras.get_children()
	cartas  = $Cartas.get_children()
	visible_ui  = false
	global_position = INIT_POSITION
	for carta in cartas:
		carta.ocultar_Carta()

func ocultar_Puzzle():
	visible_ui = false
	$AnimationPlayer.play("OCULTAR")

func mostrar_Puzzle():
	if !esta_visible():
		visible_ui = true
		$AnimationPlayer.play("MOSTRAR")

func _on_Ranura_acertado():
	var ocupados = 0
	for ranura in ranuras:
		if ranura.ocupada:
			ocupados += 1
	if ocupados == ranuras.size():
		emit_signal("completado")
		ocultar_Puzzle()

func _on_TextureButton_pressed():
	ocultar_Puzzle()

func _on_Panel_verPuzzle():
	mostrar_Puzzle()

func esta_visible():
	return visible_ui
