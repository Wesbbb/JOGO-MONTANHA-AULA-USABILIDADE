extends Node2D



const SPEED = 600.0

func _physics_process(delta):

	position.x += SPEED * delta

	if position.x > get_viewport_rect().size.x:
		queue_free() 


func _on_collision_shape_2d_draw() -> void:
	pass 
