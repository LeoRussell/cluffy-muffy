extends CharacterBody2D

@onready var _animated_sprite = $HeroMovingSprite

const SPEED = 200	

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		# another anim in future
		_animated_sprite.play("move")
		
	elif Input.is_action_pressed("move_up"):
		# another anim in future
		_animated_sprite.play("move")
		
	elif Input.is_action_pressed("move_right"):
		# another anim in future
		_animated_sprite.play("move")
		
	elif Input.is_action_pressed("move_down"):
		# another anim in future
		_animated_sprite.play("move")
		
	else:
		_animated_sprite.play("idle")
		
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
