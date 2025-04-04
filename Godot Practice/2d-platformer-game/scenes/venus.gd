extends StaticBody2D

var timeClosing = 1
var is_catching = false

func _physics_process(delta: float) -> void:
	if $PlayerDetect.is_colliding() and not is_catching:
		is_catching = true
		$Sprite2D.play("Closing")
		

func _on_sprite_2d_animation_finished() -> void:
	if($Sprite2D.animation == ("Closing")):
		$Sprite2D.play("Closed")
		$ClosedHitbox.disabled = false
		return
		
	if($Sprite2D.animation == ("Closed")):
		$Sprite2D.play("Opening")
		$ClosedHitbox.disabled = true
		return
		
	if($Sprite2D.animation == ("Opening")):
		$Sprite2D.play("Open")
		is_catching = false
		$ClosedHitbox.disabled = true
		return
	
	
