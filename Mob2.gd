extends CharacterBody2D
@export var speed: float = 70.0 

var target_velocity_x: float = -1.0
var target_velocity_y: float = 1.0

func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	

func _physics_process(delta):
	velocity.x = speed * target_velocity_x
	velocity.y = speed * target_velocity_y
	
	move_and_slide()
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
