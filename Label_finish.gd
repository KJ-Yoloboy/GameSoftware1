extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()

	text = text.insert(35, str(content))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
