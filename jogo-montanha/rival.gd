extends Node2D


var speed = 100 
var vertical_speed = 50
var direction = Vector2(-1, 0)  
var vertical_direction = 1

func _ready():
	position.x = get_viewport_rect().size.x + 50
	position.y = randf_range(50, get_viewport_rect().size.y - 50)


func _process(delta):
	var movement = direction * speed * delta
	
	if randf() < 0.02:
		vertical_direction *= -1
	movement.y += vertical_direction * vertical_speed * delta
	
	position += movement
	
	if position.x < -50:
		queue_free()
		get_parent().call_deferred("respawn_rival")
