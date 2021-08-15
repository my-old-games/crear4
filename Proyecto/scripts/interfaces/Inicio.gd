extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if $Jugar.is_hovered():
		$Jugar/Label.margin_top = 20
	else:
		$Jugar/Label.margin_top = 15
	
	if $Salir.is_hovered():
		$Salir/Label.margin_top = 20
	else:
		$Salir/Label.margin_top = 15

func _on_Jugar_pressed():
	get_tree().change_scene("res://niveles/Nivel01.tscn")

func _on_Salir_pressed():
	get_tree().quit()
