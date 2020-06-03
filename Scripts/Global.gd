extends Node

var LevelTemplate
var Character
var CameraBody

# Determined by LevelTemplate.gd (home())
var score = 0
var children_counter

# SuperSpeed vars
var SuperSpeed = false
var superspeed_ammo = 3
var SuperSpeed_Display
var SuperSpeed_Progressbar
var time_left


var ammo_sprite = load ("res://Assets/GFX/Particles/lighting_blue.png")

