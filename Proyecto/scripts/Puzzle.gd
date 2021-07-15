extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ranuras
signal completado
# Called when the node enters the scene tree for the first time.
func _ready():
	ranuras = $Ranuras.get_children()
	ocultar_Puzzle()

func ocultar_Puzzle():
	self.hide()

func mostrar_Puzzle():
	self.show()

func _on_Ranura_acertado():
	var ocupados = 0
	for ranura in ranuras:
		if ranura.ocupada:
			ocupados += 1
	if ocupados == ranuras.size():
		print("COMPLETADO")
		emit_signal("completado")
