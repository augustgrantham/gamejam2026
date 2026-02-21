extends Node2D
var winning_box_node: Node2D
var box_scene = preload("res://scenes/box.tscn")
var points = 0
var boxWithCat = 0
var boxSelected = false
var column_positions = [-550, 0, 550]
var round = 1
var duration = 0.8

@onready var winStatuslabel = $CanvasLayer/winLabel
@onready var scoreLabel = $CanvasLayer/scoreLabel
@onready var box1 = $'box1'
@onready var box2 = $'box2'
@onready var box3 = $'box3'
@onready var boxes = [box1,box2,box3]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boxSelected = true
	startRound()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startRound():
	boxSelected = true
	box1.closed()
	box2.closed()
	box3.closed()
	boxWithCat = randi_range(0,2)
	winning_box_node = boxes[boxWithCat]
	await showCat(boxes[boxWithCat])
	for i in range(0,round):
		var boxToSwap1 = randi_range(0,2)
		var boxToSwap2 = randi_range(0,2)
		while(boxToSwap1 == boxToSwap2):
			boxToSwap2 = randi_range(0,2)
		await swap_boxes(boxToSwap1,boxToSwap2)
	print(boxWithCat)
	await get_tree().create_timer(1)
	boxSelected = false
func _on_box_1_box_clicked(id: Variant) -> void:
	boxClicked(box1,1)

func _on_box_2_box_clicked(id: Variant) -> void:
	boxClicked(box2,2)

func _on_box_3_box_clicked(id: Variant) -> void:
	boxClicked(box3,3)

func boxClicked(game_box,id):
	# makes sure you haven't already picked one this round
	if(!boxSelected):
		AudioController.play_box_opening()
		if (game_box == winning_box_node):
			await game_box.open_box_animation()
			game_box.cat_hehe()
			AudioController.play_cat_meow()
			boxSelected = true
			winStatuslabel.text = "Nice Job!"
			points += 1
			scoreLabel.text = str(points)
			print("yipee!!")
			await get_tree().create_timer(2.0).timeout
			winStatuslabel.text = ""
			round += 1
			duration += 0.2
			startRound()
		else:
			await game_box.open_box_animation() 
			game_box.empty_box_animation()
			winning_box_node.cat_hehe()
			boxSelected = true
			winStatuslabel.text = "Try again!"
			await get_tree().create_timer(2.0).timeout
			print("you lost dummy")
			get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

# Gemini generated syntax for tween
func swap_boxes(col_a: int, col_b: int):
	var speed = (1/duration)
	# 1. Identify the boxes we are moving
	var first_box = boxes[col_a]
	var second_box = boxes[col_b]
	
	# 2. Update our tracking array so the game knows they moved
	boxes[col_a] = second_box
	boxes[col_b] = first_box
	
	# 3. Physically move them in the game world
	# We use a Tween to make it look smooth instead of "teleporting"
	var tween = create_tween().set_parallel(true)
	AudioController.play_swoosh()
	tween.tween_property(first_box, "position:x", column_positions[col_b], speed)
	tween.tween_property(second_box, "position:x", column_positions[col_a], speed)
	# Wait for the swap to finish before allowing more clicks
	await tween.finished
func showCat(box):
	box.cat_hehe()
	await get_tree().create_timer(1.5).timeout 
	box.closed()
	await get_tree().create_timer(0.5).timeout 
	return 1;
