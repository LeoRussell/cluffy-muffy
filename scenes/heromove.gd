extends AnimatedSprite2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		_animated_sprite.play("run")
	else:
		_animated_sprite.stop()
