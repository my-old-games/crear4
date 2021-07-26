extends KinematicBody2D

var velocity= Vector2()
export var speed = 200
export var gravity = 200

func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("WALK")
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("WALK")
	if !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		velocity.x = 0
		$AnimatedSprite.play("IDLE")
	velocity = move_and_slide(velocity,Vector2(0,-1))
