extends Node2D



const SPEED = 300.0
var velocity = Vector2.ZERO

@export var projectile_scene: PackedScene

func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED

	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED

	position += velocity * delta

	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	if projectile_scene:
		var projectile = projectile_scene.instantiate()
		get_parent().add_child(projectile)
		projectile.position = $Marker2D.global_position
		print("Disparo criado") 
	else:
		print("Erro: Cena de disparo não definida")


func _on_timer_timeout() -> void:
	pass
