extends Node2D

signal box_clicked(id)
@export var box_id = 0;
@onready var anim = $CharacterBody2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("closed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if it's the left mouse button AND it was just pressed (not released)
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			box_clicked.emit(box_id)
func open_box_animation():
	anim.play("box_opening")
	await anim.animation_finished 
func empty_box_animation():
	anim.play("empty_box")
	await anim.animation_finished 
func cat_hehe():
	anim.play("cat!")
	await anim.animation_finished 
func closed():
	anim.play("closed")
	await anim.animation_finished 
