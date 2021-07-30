extends Node2D

var visible_ui = false
var esperar = false
const SCALE_MAX = 1.5
const  INIT_POSITION = Vector2(0,-400)

func _ready():
	modulate    = Color(1,1,1,0)
	visible_ui  = false
	global_position = INIT_POSITION

func ocultar_ui():
	visible_ui = false
	esperar = true
	$Timer.start()
	$AnimationPlayer.play("OCULTAR")

func mostrar_ui(textura, scale):
	print(esta_visible())
	if !esta_visible()  and !esperar :
		print("ANIMAR")
		esperar = true
		$Timer.start()
		print(esta_visible())
		$Cuadro.set_texture(textura) 
		$Cuadro.set_global_scale(scale * SCALE_MAX) 
		$AnimationPlayer.play("MOSTRAR")

func _on_TextureButton_pressed():
	if esta_visible() and !esperar:
		ocultar_ui()

func esta_visible():
	return visible_ui

func _on_Timer_timeout():
	esperar = false
