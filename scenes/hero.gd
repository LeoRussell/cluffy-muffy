extends CharacterBody2D

@export var projectile : PackedScene
@onready var _animated_sprite = $HeroSprite
var can_shoot = true

const SPEED = 175	

func _physics_process(delta):
	# shooting
	if Input.is_action_pressed("fire_left") or Input.is_action_pressed("fire_right"):
		if can_shoot == true:
			shoot()
	
	elif Input.is_action_pressed("fire_up") or Input.is_action_pressed("fire_down"):
		if can_shoot == true:
			shoot()
			
	# moving
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

func shoot():
	can_shoot = false
	$Timer.start()
	
	var pr = projectile.instantiate()
	
	get_parent().add_child(pr)
	pr.position = $Marker2D.global_position
	

func _on_timer_timeout():
	can_shoot = true

