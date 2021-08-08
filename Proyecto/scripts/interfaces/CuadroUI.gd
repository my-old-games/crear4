extends CanvasLayer
# ---------------- VARIABLES  ---------------
var visible_ui = false
# ---------------- CONSTANTES ---------------
const  SCALE_MAX = 1.5
# ---------------- SEÑALES    ---------------
signal cerrado
# ---------------- FUNCION READY
func _ready():
	$Panel.modulate = Color(1,1,1,0)
# ---------------- FUNCION PARA OCULTAR
func ocultar_ui():
	$AnimationPlayer.play("OCULTAR")
# ---------------- FUNCION PARA MOSTRAR
func mostrar_ui(textura, scale):
	if !esta_visible():
		$Panel/Cuadro.set_texture(textura) 
		$Panel/Cuadro.set_global_scale(scale * SCALE_MAX) 
		$AnimationPlayer.play("MOSTRAR")
# ---------------- FUNCION PARA VERIFICAR VISIBILIDAD
func esta_visible():
	return visible_ui
# ---------------- MENEJADOR SEÑAL -> FINALIZAR ANIMACION
func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		'MOSTRAR':
			visible_ui = true
		'OCULTAR':
			visible_ui = false
# ---------------- MENEJADOR SEÑAL -> PRESIONAR BOTON CERRAR
func _on_CloseButton_pressed():
	if esta_visible():
		emit_signal("cerrado")
		ocultar_ui()
