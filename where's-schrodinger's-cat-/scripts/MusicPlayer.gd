extends Node

#sound file import
var highscore = 0
var game_music = preload("res://sounds/845635__wellsdesirae__upbeat-percussion-loop.wav")
var menu_music = preload("res://sounds/23559__djduppy__duppyelectro02_120bpm.wav")
var box_opening_sfx = preload("res://sounds/zapsplat_foley_pouch_velcro_rip_013_97211.mp3")
var meow = preload("res://sounds/Cat1.mp3")
var swoosh = preload("res://sounds/woosh.wav")

var shaker = preload("res://sounds/ShakerV3.mp3")

var buttonSound = preload("res://sounds/531851__tissman__menu-click-2.ogg")

@onready var musicPlayer = $MusicController
@onready var SFXPlayer = $SFXController
@onready var swooshPlayer = $swooshController
@onready var gameMenuPlayer = $MenuMusicController
func get_highscore():
	return highscore
func set_highscore(score):
	highscore = score
func play_menu():
	musicPlayer.stop()
	gameMenuPlayer.stream = menu_music
	gameMenuPlayer.play()

func play_game():
	gameMenuPlayer.stop()
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


func play_shaker():
	swooshPlayer.stream = shaker
	swooshPlayer.play()

	
func playButtonSound():
	SFXPlayer.stream = buttonSound
	SFXPlayer.play()
