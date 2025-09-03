extends CharacterBody2D

const SPEED = 750.0
const TURN_SPEED := 10.0

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction !=Vector2.ZERO:
		velocity = direction.normalized() * SPEED
		
		#this adds rotation to the spaceship btw
		var target_rotation = direction.angle() + PI / 2
		
		rotation = lerp_angle(rotation, target_rotation, TURN_SPEED * delta)
	else:
		velocity = Vector2.ZERO

	
	velocity = direction * SPEED

	move_and_slide()
