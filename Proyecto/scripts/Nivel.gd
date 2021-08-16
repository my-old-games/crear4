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
# ---------------- FUNCION PARA ACTIVAR LA PISTA DE LA INTERFAZ
func pista():
	$Controles.pista_ver()
# ---------------- MENEJADOR SEÑAL -> SE COMPLETO UN PUZZLE
func _on_Puzzle_completado():
	resueltos+= 1
	#CONDICION DE VICTORIA DEL NIVEL
	if pines.size() == resueltos:
		$Mapa/Puerta.abrir_Puerta()
		$Suyay.sorpresa()
# ---------------- MENEJADOR SEÑAL -> BOTON SALIR DEL NIVEL PRESIONADO
func _on_Salir_pressed():
	get_tree().change_scene("res://interfaces/Inicio.tscn")
