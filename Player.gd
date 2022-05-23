extends KinematicBody2D

var score = 0

const speed = 200
const jumpForce = 600
const gravity = 800

var vel = Vector2()
var grounded = false

onready var sprite = $Sprite
onready var ui = get_node("../CanvasLayer/UI")


func _ready():
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	score = int(content)
	file.close() 
	
# physics loop - same as Unity's "FixedUpdate" function
func _physics_process(delta):
	if (position.y > 875):
		die()
	
	
	vel.x = 0	
	# applying the velocity
	
	# jump inputs
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	elif Input.is_action_pressed("move_right"):
		vel.x += speed


# animation logic

	if Input.is_action_pressed("jump") and is_on_floor():
		$AnimatedSprite.play("jump")
	elif Input.is_action_pressed("move_left") and is_on_floor():
		$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("move_right") and is_on_floor():
		$AnimatedSprite.play("walk")
	elif is_on_floor():
		$AnimatedSprite.play("idle")



	# gravity
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	# sprite direction
	if vel.x < 0:
		$AnimatedSprite.flip_h = true
	elif vel.x > 0:
		$AnimatedSprite.flip_h = false

# called when we run into a coin
func collect_coin (value):
	var file = File.new()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	score = int(content)
	score += value

	file.open("user://save_game.dat", File.WRITE)
	file.store_string(String(score))
	file.close()

	ui.set_score_text(score)

func die ():
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_string("0")
	file.close()
	get_tree().reload_current_scene()
