extends Area2D

signal verPuzzle;
var isPlayer = false

export var pista = true
export var tiempo_pista = 2

func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()

func _on_Panel_body_entered(body):
	isPlayer = true
	body.elemento = self

func _on_Panel_body_exited(body):
	isPlayer = false
	body.elemento = self

func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")

func ver_elemento():
	emit_signal("verPuzzle")
