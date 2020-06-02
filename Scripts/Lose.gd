extends CanvasLayer

# Scene's Being called by LevelTemplate.gd (game_over())

func _on_TryAgainButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scene/Levels/Level1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
	

