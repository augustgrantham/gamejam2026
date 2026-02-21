extends CenterContainer
@onready var click_sound = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://credits.tscn")
func _play_click_sound():click_sound.play()
