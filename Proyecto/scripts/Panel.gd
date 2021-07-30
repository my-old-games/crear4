extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal verPuzzle;
var isPlayer = false

export var pista = true
export var tiempo_pista = 2

func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()

func _input(event):
	if event.is_action_pressed("ui_see") and isPlayer:
		emit_signal("verPuzzle")

func _on_Panel_body_entered(_body):
	isPlayer = true

func _on_Panel_body_exited(_body):
	isPlayer = false

func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")
