extends Node2D

var box_scene = preload("res://Box.tscn")
var points = 0
var boxWithCat = randi_range(1,3)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	print(boxWithCat)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_box_1_box_clicked(id: Variant) -> void:
	boxClicked(1)

func _on_box_2_box_clicked(id: Variant) -> void:
	boxClicked(2)

func _on_box_3_box_clicked(id: Variant) -> void:
	boxClicked(3)

func boxClicked(id):
	if (id == boxWithCat):
		print("yipee!!")
	else:
		print("you lost dummy")
