extends KinematicBody2D

export var palabra = "SI"

var dragging = false
var pick = true
var acertada = false
var init_pos

signal dragsignal;
signal showcard;
signal hidecard;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	init_pos = self.global_position

func _process(_delta):
	if dragging and !acertada:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	if !acertada:
		dragging=!dragging
		if dragging:
			emit_signal("showcard")
		else:
			emit_signal("hidecard")
			self.reposicionar_ficha(self.global_position)
			esperar_reposicion()

func _on_Ficha_input_event(_viewport, event, _shape_idx):
	if pick:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				emit_signal("dragsignal")
			elif event.button_index == BUTTON_LEFT and !event.pressed:
				emit_signal("dragsignal")
		elif event is InputEventScreenTouch:
			if event.pressed and event.get_index() == 0:
				self.position = event.get_position()
			
func reposicionar_ficha(desde):
	$Tween.interpolate_property(self, "position",
		desde, init_pos, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
func animar_error():
	$AnimationPlayer.play("ERROR")

func animar_acierto():
	$AnimationPlayer.play("ACIERTO")

func esperar_reposicion():
	print("ESPERAR HASTA REPOSICIONAR LA FICHA")
	pick = false

func _on_Tween_tween_completed(_object, _key):
	pick = true
