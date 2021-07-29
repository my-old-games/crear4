extends Node2D

var visible_ui = false
const SCALE_MAX = 1.5

func _ready():
	modulate    = Color(1,1,1,0)
	visible_ui  = false
	$TextureButton.set_disabled(true)

func ocultar_ui():
	visible_ui = false
	$AnimationPlayer.play("OCULTAR")

func mostrar_ui(textura, scale):
	if !esta_visible():
		visible_ui = true
		$TextureButton.set_disabled(false)
		$Cuadro.set_texture(textura) 
		$Cuadro.set_global_scale(scale * SCALE_MAX) 
		$AnimationPlayer.play("MOSTRAR")

func _on_TextureButton_pressed():
	if esta_visible():
		ocultar_ui()
		$TextureButton.set_disabled(true)

func esta_visible():
	return visible_ui
