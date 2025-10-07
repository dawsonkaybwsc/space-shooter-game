extends CharacterBody2D

@export var speed: float = 120.0 
var player: CharacterBody2D = null

func _ready():
	# Animation setup is fine
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()


func _physics_process(delta):
	if player == null:
		player = get_tree().root.get_node_or_null("GameWorld/Player")
		
	
	if is_instance_valid(player):
		var direction: Vector2 = (player.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO 
		
	move_and_slide() 


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
