extends Node2D

@export var audio_library: AudioLibrary
var players: Array[AudioStreamPlayer]

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	audio_library = AudioLibrary.new()
	audio_library.add_sound("spoopy", "res://audio_files/spoopy.mp3")
	audio_library.add_sound("pop", "res://audio_files/stock_pop.mp3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var removing: Array[int] = []
	for i in range(players.size()):
		var a = players[i]
		if !a.is_playing():
			removing.push_back(i)
	if removing.size()>0:
		for j in range(removing.size()-1, -1, -1):
			print(removing[j])
			players[removing[j]].queue_free()
			players.remove_at(removing[j])
	
func play_sound_from_tag(tag: String) -> void:
	if tag: 
		var audio = audio_library.grab(tag)
		if audio.isMusic:
			if $BGMusicPlayer.playing: $BGMusicPlayer.stop()
			$BGMusicPlayer.stream = audio.stream
			$BGMusicPlayer.play()
		else:
			players.push_back(AudioStreamPlayer.new())
			add_child(players[players.size()-1])
			players[players.size()-1].stream = audio.stream
			players[players.size()-1].play()
			
	
func _input(_ev):
	if Input.is_key_pressed(KEY_K):
		play_sound_from_tag("pop")
