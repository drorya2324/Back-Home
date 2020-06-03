extends TextureProgress

func _ready():
	Global.SuperSpeed_Progressbar = self
	value = 0
	
	
func _process(delta):
	#value -= step
	if Global.SuperSpeed:
		value = Global.time_left 

# Being called# by LevelTemplate.gd
#func timeout(amount):
#	print("value changing")
#	value = amount *100
