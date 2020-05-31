extends "res://Scripts/Lose.gd"

func _ready():
	$CenterContainer/VBoxContainer/ScoreLabel.text = ""
	update_score()


func update_score():
	$CenterContainer/VBoxContainer/ScoreLabel.text = str(Global.score)

#	 change scene (score, next level, quit, try again)
