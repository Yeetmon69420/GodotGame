extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Harbinger-of-Blades/World.tscn")


func _on_exit_pressed():
	get_tree().quit()
