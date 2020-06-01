extends "res://Scripts/Lose.gd"

func _ready():
	pause_mode = PAUSE_MODE_PROCESS
	$CenterContainer/VBoxContainer/ScoreLabel.text = ""
	update_score()


func update_score():
	$CenterContainer/VBoxContainer/ScoreLabel.text = str(Global.score)

#	 change scene (score, next level, quit, try again)
