extends KinematicBody2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var speed = 200
export var gravity = 200
# ---------------- VARIABLES    ---------------
var velocity = Vector2()
var elemento = null
# ---------------- FUNCION INPUT
func _input(event):
	if event.is_action("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("WALK")
	if event.is_action("ui_right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("WALK")
	if event.is_action_pressed("ui_see") and elemento != null:
		$AnimatedSprite.play("SEE")
	if event.is_action_released("ui_left") or event.is_action_released("ui_right") and  !event.is_action_pressed("ui_see"):
		velocity.x = 0
		$AnimatedSprite.play("IDLE")
# ---------------- FUNCION PROCESS
func _process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity,Vector2(0,-1))
# ---------------- FUNCION PARA ANIMAR LA VISTA DE UN OBJETO
func ver_objeto():
	$AnimatedSprite.play("SEE")
# ---------------- FUNCION PARA SALIR DE MODO VISTA DE OBJETO
func reiniciar():
	$AnimatedSprite.play("IDLE")
# ---------------- MENEJADOR SEÑAL -> FINALIZAR ANIMACION
func _on_AnimatedSprite_animation_finished():
	match $AnimatedSprite.animation:
		'SEE':
			elemento.ver_elemento()

