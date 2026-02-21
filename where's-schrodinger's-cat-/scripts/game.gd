extends Node2D

var box_scene = preload("res://scenes/box.tscn")
var points = 0
var boxWithCat = 0
var boxSelected = false
@onready var winStatuslabel = $CanvasLayer/winLabel
@onready var scoreLabel = $CanvasLayer/scoreLabel
@onready var box1 = $'box1'
@onready var box2 = $'box2'
@onready var box3 = $'box3'
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startRound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startRound():
	box1.closed()
	box2.closed()
	box3.closed()
	boxSelected = false
	boxWithCat = randi_range(1,3)
	print(boxWithCat)
func _on_box_1_box_clicked(id: Variant) -> void:
	boxClicked(box1,1)

func _on_box_2_box_clicked(id: Variant) -> void:
	boxClicked(box2,2)

func _on_box_3_box_clicked(id: Variant) -> void:
	boxClicked(box3,3)

func boxClicked(game_box,id):
	if(!boxSelected):
		AudioController.play_box_opening()
		if (id == boxWithCat):
			await game_box.open_box_animation()
			game_box.cat_hehe()
			boxSelected = true
			winStatuslabel.text = "Nice Job!"
			points += 1
			scoreLabel.text = str(points)
			print("yipee!!")
			await get_tree().create_timer(2.0).timeout
			winStatuslabel.text = ""
			startRound()
		else:
			await game_box.open_box_animation() 
			game_box.empty_box_animation()
			boxSelected = true
			winStatuslabel.text = "Try again!"
			await get_tree().create_timer(2.0).timeout
			print("you lost dummy")
			get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

	
