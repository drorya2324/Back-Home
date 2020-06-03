extends "res://Scene/cars/cars.gd"

func _ready():
	speed = 30
	w_time = 2.5
	start_pos = self.translation
	S_speed = speed/2

# Being called by LevelTemplate.gd (superspeed_activate())
func superspeed(booli):
	if booli ==true:
		$Timer.wait_time = $Timer.wait_time*2
	else:
		$Timer.wait_time = w_time
