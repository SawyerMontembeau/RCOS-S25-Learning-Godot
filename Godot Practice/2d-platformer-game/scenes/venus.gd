extends CharacterBody2D

var timeClosing = 1

func _physics_process(delta: float) -> void:
	
	if($PlayerDetect.is_colliding()):
		$Sprite2D.play("Closing")
	
		
		
	
	

	move_and_slide()
