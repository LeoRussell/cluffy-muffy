extends CharacterBody2D

@export var projectile : PackedScene
@onready var _animated_sprite = $HeroSprite

const SPEED = 175	

func _physics_process(delta):
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		_animated_sprite.play("move")
	
	# idk how to write it better. XP
	elif Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
		_animated_sprite.play("move")
				
	else:
		_animated_sprite.play("idle")
		
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()

