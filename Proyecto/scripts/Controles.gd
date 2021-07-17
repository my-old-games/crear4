extends Node2D

func _ready():
	pass # Replace with function body.

func _on_LeftButton_button_down():
	Input.action_press("ui_left")

func _on_LeftButton_button_up():
	Input.action_release("ui_left")

func _on_RightButton_button_down():
	Input.action_press("ui_right")

func _on_RightButton_button_up():
	Input.action_release("ui_right")

func _on_VerButton_button_down():
	Input.action_press("ui_see")

func _on_VerButton_button_up():
	Input.action_release("ui_see")
