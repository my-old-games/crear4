extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal verPuzzle;
var isPlayer = false

export var pista = true
export var tiempo_pista = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	if pista:
		$Timer.set_wait_time(tiempo_pista)
		$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if isPlayer and Input.is_action_just_released("ui_see"):
		emit_signal("verPuzzle")

func _on_Panel_body_entered(_body):
	isPlayer = true

func _on_Panel_body_exited(_body):
	isPlayer = false

func _on_Timer_timeout():
	$AnimationPlayer.play("BRILLAR")
