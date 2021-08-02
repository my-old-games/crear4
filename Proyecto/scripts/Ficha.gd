extends KinematicBody2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var palabra = "SI"
export var tiempo_reposicion = 0.8
# ---------------- VARIABLES  ---------------
var dragging = false
var pick = true
var acertada = false
var init_pos
# ---------------- SEÑALES    ---------------
signal dragsignal;
signal showcard;
signal hidecard;
# ---------------- FUNCION READY
func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	init_pos = position
# ---------------- FUNCION PROCESS
func _process(_delta):
	if dragging and !acertada:
		var mousepos = get_viewport().get_mouse_position()
		position = Vector2(mousepos.x, mousepos.y)
# ---------------- FUNCION PARA REPOSICIONAR LA FICHA CON UN TWEEN
func reposicionar_ficha(desde):
	$Tween.interpolate_property(self, "position",
		desde, init_pos, tiempo_reposicion,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
# ---------------- FUNCION PARA ANIMAR LA FICHA CUANDO NO ENCAJA EN LA RANURA
func animar_error():
	$AnimationPlayer.play("ERROR")
# ---------------- FUNCION PARA ANIMAR LA FICHA CUANDO SI ENCAJA EN LA RANURA
func animar_acierto():
	$AnimationPlayer.play("ACIERTO")
# ---------------- FUNCION PARA DETERMINAR QUE LA FICHA REQUIERE REPOSICION
func esperar_reposicion():
	pick = false
# ---------------- MENEJADOR SEÑAL -> SOLTAR/TOMAR FICHA
func _set_drag_pc():
	if !acertada:
		dragging=!dragging
		if dragging:
			emit_signal("showcard")
		else:
			emit_signal("hidecard")
			reposicionar_ficha(global_position)
			esperar_reposicion()
# ---------------- MENEJADOR SEÑAL -> INPUT SOBRE LA FICHA
func _on_Ficha_input_event(_viewport, event, _shape_idx):
	if pick:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				emit_signal("dragsignal")
			elif event.button_index == BUTTON_LEFT and !event.pressed:
				emit_signal("dragsignal")
		elif event is InputEventScreenTouch:
			if event.pressed and event.get_index() == 0:
				position = event.get_position()
# ---------------- MENEJADOR SEÑAL -> PRESIONAR BOTON CERRAR
func _on_Tween_tween_completed(_object, _key):
	pick = true
