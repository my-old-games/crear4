extends KinematicBody2D
# ---------------- VARIABLES CONFIGURABLES  ---------------
export var speed = 200
export var gravity = 200
# ---------------- VARIABLES    ---------------
var velocity = Vector2()
var elemento = null
# ---------------- FUNCION READY
func _ready():
	$AnimatedSprite.play("IDLE")
# ---------------- FUNCION INPUT
func _input(event):
	if event.is_action_pressed("ui_see"):
		if elemento != null:
			$AnimatedSprite.play("SEE")
	else:
		if event.is_action("ui_left"):
			velocity.x = -speed
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("WALK")
		if event.is_action("ui_right"):
			velocity.x = speed
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("WALK")
		if event.is_action_released("ui_left") or event.is_action_released("ui_right"):
			velocity.x = 0
			if elemento != null:
				$AnimatedSprite.play("DOUBT")
			else:
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
# ---------------- FUNCION PARA REPRODUCIR FUNCION SORPRESA
func sorpresa():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("OMG")
# ---------------- MENEJADOR SEÑAL -> FINALIZAR ANIMACION
func _on_AnimatedSprite_animation_finished():
	match $AnimatedSprite.animation:
		'SEE':
			elemento.ver_elemento()

