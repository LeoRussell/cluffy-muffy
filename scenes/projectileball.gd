extends CharacterBody2D

@onready var _animated_sprite = $BallSprite

@onready var direction = Input.get_vector("fire_left", "fire_right", "fire_up", "fire_down")
const SPEED = 250


func _on_ready():
	_animated_sprite.play("flight")

func _process(delta):
	velocity = direction * SPEED
	
	move_and_slide()


func _on_ball_signal_body_entered(body):
	print(body.name)
	# damage dealing seaction
	if body.name.begins_with("enemyF"):
		body.get_damage(1)
	
	# ball fade animation
	$BallSignal.queue_free()
	_animated_sprite.play("broken")
	direction = -direction
	$Timer.start()
	
	
	
func _on_timer_timeout():
	queue_free()



