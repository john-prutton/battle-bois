extends CharacterBody3D

func _process(delta: float) -> void:
	var input = Vector3(
		Input.get_axis("walk_left", "walk_right"),
		0,
		Input.get_axis("walk_up", "walk_down")
	)
	
	if input.length() != 0:
		input.limit_length(1)
	elif velocity.length() > 0.25:
		input = -0.25 * velocity
		input.y = 0
	else:
		input = -velocity
		input.y = 0
	
	var magnitudes_multiplied = input.length() * velocity.length()
	var direction_difference_multiplier = 1 + max(
		-(input.dot(velocity) / magnitudes_multiplied) if magnitudes_multiplied != 0 else 0,
		0
	)
	
	velocity += 50 * direction_difference_multiplier * delta * input
	velocity.y = (velocity.y + -1 * delta) if !is_on_floor() else 0
	velocity = velocity.limit_length(10)
	
	move_and_slide()
