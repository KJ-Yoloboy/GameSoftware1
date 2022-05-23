tool
extends Button


export(String, FILE) var next_scene_path: = ""


func _on_button_up() -> void:
	#PlayerData.reset()
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_string("0")
	file.close()
	get_tree().change_scene("res://MainScene.tscn")


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_scene_path == "" else ""
