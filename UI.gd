extends Control

onready var scoreText = get_node("ScoreText")

func _ready():
	
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	scoreText.text = str(content)

func set_score_text (score):
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	scoreText.text = str(content)
