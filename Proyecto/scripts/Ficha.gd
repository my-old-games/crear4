extends KinematicBody2D

export var palabra = "SI"

var dragging = false
var pick = true
var init_pos

signal dragsignal;
signal showcard;
signal hidecard;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	init_pos = self.global_position

func _process(delta):
	if dragging and pick:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging=!dragging
	if dragging:
		emit_signal("showcard")
	else:
		emit_signal("hidecard")

func _on_Ficha_input_event(viewport, event, shape_idx):
	print("S")
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()
