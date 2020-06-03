extends "res://Scene/cars/cars.gd"


func _ready():
	speed = 50
	w_time = 1.3
	start_pos = self.translation
	S_speed = speed/2
	
func superspeed(booli):
	if booli ==true:
		$Timer.wait_time = $Timer.wait_time*2
	else:
		$Timer.wait_time = w_time
