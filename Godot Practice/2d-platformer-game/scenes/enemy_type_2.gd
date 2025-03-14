extends CharacterBody2D

var speed = 700.0
var jump_speed = 100.0
var facing_right = true
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		
	if(facing_right && $Vision.is_colliding() && is_on_floor()):
		if($Vision.get_collider() is CharacterBody2D):
			if(!$WallCheck.is_colliding()):
				velocity.x = speed
		if($Vision.get_collider() is not CharacterBody2D && $WallCheck.is_colliding()):
			flip()
			velocity.x = 0
			
	elif(!facing_right && $Vision.is_colliding() && is_on_floor()):
		if($Vision.get_collider() is CharacterBody2D):
			if(!$WallCheck.is_colliding()):
				velocity.x = speed * -1
		if($Vision.get_collider() is not CharacterBody2D && $WallCheck.is_colliding()):
			flip()
			velocity.x = 0
	

	move_and_slide()
	
func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
