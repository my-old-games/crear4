extends Node2D

var pines
var resueltos = 0

func _ready():
	pines = $Pines.get_children()

func _on_Puzzle_completado():
	resueltos+= 1
	if pines.size() == resueltos:
		$Mapa/Puerta.abrir_Puerta()

func verificar_pines():
	for pin in pines:
		print(pin.esta_abierto())
