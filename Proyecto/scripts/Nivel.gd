extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Puzzle_completado():
	$Puerta.abrir_Puerta()
	$Puzzle.ocultar_Puzzle()

func _on_Panel_verPuzzle():
	$Puzzle.mostrar_Puzzle()
