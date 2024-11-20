extends CharacterBody3D

func _process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += -1 * delta
	else:
		velocity.y = 0
		
	move_and_slide()
