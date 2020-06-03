extends "res://Scene/cars/cars.gd"

func _ready():
	speed = 35
	w_time = 2
	start_pos =self.translation
	S_speed = speed/2
	
func superspeed(booli):
	if booli ==true:
		$Timer.wait_time = $Timer.wait_time*2
	else:
		$Timer.wait_time = w_time
