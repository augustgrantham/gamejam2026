extends Control

# This "onready" line lets the script find your audio node easily
@onready var click_sound = $AudioStreamPlayer2D

func _on_button_pressed():
	# 1. Play the sound
	click_sound.play()
	
	# 2. (Optional) Wait for a tiny bit so the player hears it 
	# before the scene vanishes!
	await get_tree().create_timer(0.1).timeout
	
	# 3. Change the scene
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
