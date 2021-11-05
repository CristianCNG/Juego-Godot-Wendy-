extends Node

func replay():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.play()
