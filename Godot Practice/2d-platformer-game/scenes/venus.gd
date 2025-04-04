extends CharacterBody2D

var timeClosing = 1
var is_catching = false

func _physics_process(delta: float) -> void:
	if $PlayerDetect.is_colliding() and not is_catching:
		$Sprite2D.play("Closing")
	move_and_slide()


func _on_sprite_2d_animation_finished(anim_name):
	if(anim_name == ("Closing")):
		$Sprite2D.play("Closed")
		is_catching = false
