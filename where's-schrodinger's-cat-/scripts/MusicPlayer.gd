extends Node

#sound file import
var highscore = 0
var game_music = preload("res://sounds/845635__wellsdesirae__upbeat-percussion-loop.wav")
var menu_music = preload("res://sounds/23559__djduppy__duppyelectro02_120bpm.wav")
var box_opening_sfx = preload("res://sounds/zapsplat_foley_pouch_velcro_rip_013_97211.mp3")
var meow = preload("res://sounds/Cat1.mp3")
var swoosh = preload("res://sounds/woosh.wav")
<<<<<<< HEAD
var shaker = preload("res://sounds/ShakerV3.mp3")
=======
var buttonSound = preload("res://sounds/531851__tissman__menu-click-2.ogg")
>>>>>>> e7a3429362ad3d0474686895c2d3afeee2cbb3ac
@onready var musicPlayer = $MusicController
@onready var SFXPlayer = $SFXController
@onready var swooshPlayer = $swooshController

func get_highscore():
	return highscore
func set_highscore(score):
	highscore = score
func play_menu():
	
	if musicPlayer.stream == menu_music: 
		return # Don't restart if it's already playing
	musicPlayer.stream = menu_music
	musicPlayer.play()

func play_game():
	musicPlayer.stream = game_music
	musicPlayer.play()

func play_box_opening():
	SFXPlayer.stream = box_opening_sfx
	SFXPlayer.play()
	
func play_cat_meow():
	SFXPlayer.stream = meow
	SFXPlayer.play()

func play_swoosh():
	swooshPlayer.stream = swoosh
	swooshPlayer.play()
<<<<<<< HEAD

func play_shaker():
	swooshPlayer.stream = shaker
	swooshPlayer.play()
=======
	
func playButtonSound():
	SFXPlayer.stream = buttonSound
	SFXPlayer.play()
>>>>>>> e7a3429362ad3d0474686895c2d3afeee2cbb3ac
