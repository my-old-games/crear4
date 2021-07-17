extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func abrir_Puerta():
	$AnimatedSprite.play("ABIERTO")
  
func _on_Puerta_body_entered(body):
	if $AnimatedSprite.animation  == "ABIERTO" :
		print("VICTORIA")
	else:
		print(body)
