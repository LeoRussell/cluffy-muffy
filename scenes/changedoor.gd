extends Area2D

@onready var _animated_sprite = $AnimatedSprite2D
@export_file("*.tscn") var next_level

func _on_visibility_changed():
	_animated_sprite.play("open")
	$CollisionShape2D.position.x -= 25
	
	
func _on_body_entered(body):
	get_tree().change_scene_to_file(next_level)
