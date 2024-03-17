extends CharacterBody2D


@onready var _player = $"../Hero"
@onready var _animated_sprite = $EnemyFSprite

var speed = 1
var _health = 3


func _on_ready():
	_animated_sprite.play("idle")


func _physics_process(delta):
	move(_player)


func get_damage(points):
	_health -= points
	if _health <= 0:
		$CollisionShape2D.queue_free()
		get_parent().update(-1)
		
		$DeathTimer.start()
		_animated_sprite.play("death")
		speed = 0
		
func move(target):
	var playerPos = target.transform.origin
	var direction = playerPos - global_position
	
	if playerPos.distance_to(global_position) >= 150:
		direction = Vector2(0, 0)
		if speed != 0:
			_animated_sprite.play("idle") 
	else:
		if speed != 0:
			_animated_sprite.play("move")
	velocity = direction * speed
	move_and_slide()
	
	
func _on_death_timer_timeout():
	queue_free()
