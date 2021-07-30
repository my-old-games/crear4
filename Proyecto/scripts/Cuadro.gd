extends Node2D

export var pista = true
export var tiempo_pista = 2

var isPlayer = false

signal verCuadro;


func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()

func _input(event):
	if event.is_action_pressed("ui_see") and isPlayer:
		emit_signal("verCuadro", $Pintura.get_texture(), $Pintura.get_global_scale())

func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")

func _on_Cuadro_body_entered(body):
	isPlayer = true

func _on_Cuadro_body_exited(body):
	isPlayer = false
