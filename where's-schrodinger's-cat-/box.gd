extends Node2D

signal box_clicked(id)
@export var box_id = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if it's the left mouse button AND it was just pressed (not released)
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			box_clicked.emit(box_id)
