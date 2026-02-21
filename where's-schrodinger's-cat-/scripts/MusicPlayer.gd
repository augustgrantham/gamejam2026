extends AudioStreamPlayer

# Make sure these names match your FileSystem exactly!
var game_music = preload("res://531851__tissman__menu-click-2.ogg")
var menu_music = preload("res://23559__djduppy__duppyelectro02_120bpm.wav")

func play_menu():
	if stream == menu_music: 
		return # Don't restart if it's already playing
	stream = menu_music
	play()

func play_game():
	stream = game_music
	play()
