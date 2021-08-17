extends Node2D
# ---------------- MENEJADOR SEÑAL -> BOTON SALIR DEL NIVEL PRESIONADO
func _on_Salir_pressed():
	get_tree().change_scene("res://interfaces/Inicio.tscn")
