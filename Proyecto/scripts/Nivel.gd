extends Node2D
# ---------------- VARIABLES  ---------------
var pines
var resueltos = 0
# ---------------- FUNCION READY
func _ready():
	pines = $Pines.get_children()
# ---------------- FUNCION PARA VERIFICAR ESTADOS DE LOS PINES
func verificar_pines():
	for pin in pines:
		print(pin.esta_abierto())
# ---------------- MENEJADOR SEÑAL -> SE COMPLETO UN PUZZLE
func _on_Puzzle_completado():
	resueltos+= 1
	#CONDICION DE VICTORIA DEL NIVEL
	if pines.size() == resueltos:
		$Mapa/Puerta.abrir_Puerta()
