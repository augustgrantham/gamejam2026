extends Node

# Make sure these names match your FileSystem exactly!
var game_music = preload("res://sounds/845635__wellsdesirae__upbeat-percussion-loop.wav")
var menu_music = preload("res://sounds/23559__djduppy__duppyelectro02_120bpm.wav")
var box_opening_sfx = preload("res://sounds/zapsplat_foley_pouch_velcro_rip_013_97211.mp3")
@onready var musicPlayer = $MusicController
@onready var SFXPlayer = $SFXController
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
