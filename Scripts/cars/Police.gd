extends "res://Scene/cars/cars.gd"

func _ready():
	speed = 60
	start_pos = self.translation
	print("police start_pos = ", start_pos)
	
