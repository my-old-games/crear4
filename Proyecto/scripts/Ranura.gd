extends Area2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var palabra = "SI"
# ---------------- VARIABLES    ---------------
var ocupada = false
# ---------------- SEÑALES    ---------------
signal acertado;
# ---------------- FUNCION READY
func _ready():
	$Palabra.text = ''
# ---------------- MENEJADOR SEÑAL -> UNA FICHA INGRESA EN LA RANURA
func _on_Ranura_body_entered(body):
	if !ocupada:
		if palabra == body.palabra:
			body.acertada = true
			body.global_position = self.global_position
			ocupada = true
			emit_signal("acertado")
			$AnimatedSprite.play("OCUPADA")
			$Palabra.text = body.palabra
			body.animar_acierto()
		else:
			body._set_drag_pc()
			$AnimatedSprite.play("ERROR")
			body.animar_error()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation  == "ERROR":
		$AnimatedSprite.play("LIBRE")
