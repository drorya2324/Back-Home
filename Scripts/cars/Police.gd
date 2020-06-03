extends "res://Scene/cars/cars.gd"

func _ready():
	speed = 60
	w_time = 1.5
	start_pos = self.translation
	S_speed = speed/2
	
#Bing called by LevelTemplate.gd
func superspeed(booli):
	if booli ==true:
		$Timer.wait_time = $Timer.wait_time*2
	else:
		$Timer.wait_time = w_time
