extends CanvasLayer

var visible_ui = false
const  SCALE_MAX = 1.5

func _ready():
	$Panel.modulate = Color(1,1,1,0)

func ocultar_ui():
	$AnimationPlayer.play("OCULTAR")

func mostrar_ui(textura, scale):
	if !esta_visible():
		$Panel/Cuadro.set_texture(textura) 
		$Panel/Cuadro.set_global_scale(scale * SCALE_MAX) 
		$AnimationPlayer.play("MOSTRAR")

func esta_visible():
	return visible_ui

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		'MOSTRAR':
			visible_ui = true
		'OCULTAR':
			visible_ui = false

func _on_CloseButton_pressed():
	if esta_visible():
		ocultar_ui()
