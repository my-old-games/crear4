extends Node2D


func abrir_Pin():
	$AnimatedSprite.play("ABIERTO")

func cerrar_Pin():
	$AnimatedSprite.play("CERRADO")

func esta_abierto():
	print($AnimatedSprite.animation)
	return $AnimatedSprite.animation  == "ABIERTO"

func _on_Puzzle_completado():
	self.abrir_Pin()
