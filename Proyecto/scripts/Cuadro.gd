extends Node2D

export var pista = true
export var tiempo_pista = 2

var isPlayer = false

signal verCuadro;


func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()

func _process(_delta):
	if isPlayer and Input.is_action_just_released("ui_see"):
		emit_signal("verCuadro", $Pintura.get_texture(), $Pintura.get_global_scale())

func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")

func _on_Cuadro_body_entered(body):
	isPlayer = true

func _on_Cuadro_body_exited(body):
	isPlayer = false
