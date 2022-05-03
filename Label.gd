extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
