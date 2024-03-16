extends CharacterBody2D

@onready var _animated_sprite = $BallSprite
@onready var ball = $ProjectileBall

@onready var direction = Input.get_vector("fire_left", "fire_right", "fire_up", "fire_down")
const SPEED = 250


func _on_ready():
	$Timer.start()

func _process(delta):
	_animated_sprite.play("flight")
	velocity = direction * SPEED
	
	move_and_slide()

func _on_ball_signal_area_entered(area):
	queue_free()

func _on_ball_signal_body_entered(body):
	queue_free()
	
func _on_timer_timeout():
	queue_free()



