extends StaticBody2D

var health = 3
@onready var _animated_sprite = $EnemyFSprite


func _on_ready():
	_animated_sprite.play("idle")


func _process(delta):
	pass


func get_damage(points):
	health -= points
	if health <= 0:
		$CollisionShape2D.queue_free()
		
		$DeathTimer.start()
		_animated_sprite.play("death")
		
		
func _on_death_timer_timeout():
	queue_free()
