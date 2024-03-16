extends Area2D


@onready var _animated_sprite = $EnemyFSprite

func _process(delta):
	_animated_sprite.play("idle")


func _on_body_entered(body):
	if body.name == "ProjectileBall":
		body.queue_free()


func _on_body_exited(body):
	if body.name == "ProjectileBall":
		body.queue_free()
