extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cred_pressed():
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")


func _on_next_pressed():
	get_tree().change_scene_to_file("res://scenes/game2.tscn")
