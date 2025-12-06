extends Control

# Tombol Start Game
func _on_StartButton_pressed():
	get_tree().change_scene("res://trahhunt.tscn") # ganti path sesuai scene game

# Tombol About
func _on_AboutButton_pressed():
	get_tree().change_scene("res://AboutScene.tscn") # scene info game

# Tombol Exit
func _on_ExitButton_pressed():
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/trashhunt.tscn")
