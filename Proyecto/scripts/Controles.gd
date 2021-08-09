extends CanvasLayer
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var pista = true

func pista_ver():
	if pista:
		$AnimationPlayer.play("BLINK_SEE")
