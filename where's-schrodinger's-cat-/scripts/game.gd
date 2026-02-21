extends Node2D

var box_scene = preload("res://scenes/box.tscn")
var points = 0
var boxWithCat = 0
var boxSelected = false
@onready var winStatuslabel = $CanvasLayer/winLabel
@onready var scoreLabel = $CanvasLayer/scoreLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startRound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startRound():
	boxSelected = false
	boxWithCat = randi_range(1,3)
	print(boxWithCat)
func _on_box_1_box_clicked(id: Variant) -> void:
	boxClicked(1)

func _on_box_2_box_clicked(id: Variant) -> void:
	boxClicked(2)

func _on_box_3_box_clicked(id: Variant) -> void:
	boxClicked(3)

func boxClicked(id):
	if(!boxSelected):
		if (id == boxWithCat):
			boxSelected = true
			winStatuslabel.text = "Nice Job!"
			points += 1
			scoreLabel.text = str(points)
			print("yipee!!")
			await get_tree().create_timer(2.0).timeout
			winStatuslabel.text = ""
			startRound()
		else:
			winStatuslabel.text = "Nice Try!"
			await get_tree().create_timer(2.0).timeout
			print("you lost dummy")
			get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
