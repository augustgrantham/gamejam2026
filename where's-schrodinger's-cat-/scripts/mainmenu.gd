extends Control
@onready var click_sound = $AudioStreamPlayer2D

# This handles the Start Button
func _on_start_pressed():
	click_sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://game.tscn")

# This handles the Settings/Credits Button
func _on_credits_pressed():
	click_sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://credits.tscn")


func _on_button_pressed() -> void:
	pass # Replace with function body.
