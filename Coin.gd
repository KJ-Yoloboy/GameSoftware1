extends Area2D

export var value = 10


# called when something collides with us
func _on_Coin_body_entered(body):
	# was it the player?
	if body.get_name() == "Player":
		body.collect_coin(value)
		queue_free()
