extends StaticBody2D


@onready var _animated_sprite = $EnemyFSprite

func _process(delta):
	_animated_sprite.play("idle")
