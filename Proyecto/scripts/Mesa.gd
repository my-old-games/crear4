extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Mesa_body_entered(body):
	body.cartas = true
	print(body)
