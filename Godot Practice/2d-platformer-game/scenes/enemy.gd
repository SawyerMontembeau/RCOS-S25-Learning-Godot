extends CharacterBody2D

var normal_speed = 60.0
var speed = normal_speed
var facing_right = true
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if !$fallingCheck.is_colliding() && is_on_floor() && $WallCheck.get_collider() is not CharacterBody2D:
		flip()
		
	if $WallCheck.is_colliding() && is_on_floor() && $WallCheck.get_collider() is not CharacterBody2D:
		flip()

	velocity.x = speed

	move_and_slide()
	
func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(normal_speed)
		#normal_speed = 60.0
	else:
		speed = abs(normal_speed) * -1
		#normal_speed = -60.0
