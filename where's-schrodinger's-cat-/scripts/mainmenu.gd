extends Control
@onready var click_sound = $AudioStreamPlayer2D
func _ready():
	MusicPlayer.play_menu()
# This handles the Start Button
func _on_start_pressed():
	click_sound.play()
	MusicPlayer.play_game() # Switches music to game track
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn") # MUST have () after get_tree

func _on_credits_pressed():
	click_sound.play()
	# We don't change the music here so the menu track keeps playing
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_button_pressed() -> void:
	pass # Replace with function body.
