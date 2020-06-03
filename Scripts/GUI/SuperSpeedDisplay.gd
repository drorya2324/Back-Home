extends ItemList


func _ready():
	Global.SuperSpeed_Display = self
	
	update_display(Global.superspeed_ammo)
	

# Being called bt LevelTemplate.gd (superspeed_activate())
func update_display(Ss_ammo):
	clear()
	for ammo in range (Ss_ammo):
		if Ss_ammo > 0:
			add_icon_item(Global.ammo_sprite, false)
		else:
			clear()

