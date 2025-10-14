extends CharacterBody2D

@export var speed: float = 70.0 
var direction: int = 1

var player: CharacterBody2D = null

func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	
func _physics_process(delta):

	velocity.x = speed * direction
	move_and_slide()
	if is_on_wall():
		direction *= -1
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false

	velocity.y = speed * direction
	move_and_slide()
	if is_on_wall():
		direction *= -1
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
