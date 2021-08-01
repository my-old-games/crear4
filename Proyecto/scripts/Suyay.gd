extends KinematicBody2D

export var speed = 200
export var gravity = 200

var velocity = Vector2()
var elemento = null

func _ready():
	pass # Replace with function body.

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
	if event.is_action_released("ui_left") or event.is_action_released("ui_right"):
		velocity.x = 0
		$AnimatedSprite.play("IDLE")

func _process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity,Vector2(0,-1))

func ver_objeto():
	$AnimatedSprite.play("SEE")

func _on_AnimatedSprite_animation_finished():
	match $AnimatedSprite.animation:
		'SEE':
			elemento.ver_elemento()

