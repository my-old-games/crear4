extends Node2D

export var pista = true
export var tiempo_pista = 2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")
