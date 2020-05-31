extends Spatial

onready var Characters_node = self.get_child(4)
onready var prev_character
#onready var current_charge = get_charge()
#onready var last_character = get_last()
var characters_list ={}
var next_character
var folder_counter = 0
var children_counter = 1
#var charge_counter=0
var animal_killed = false



func _ready():
	Global.LevelTemplate = self
	characters_list = FileGrabber.get_files("res://Scene/characters/actual_characters_folder/")


func _process(delta):
	if animal_killed:
		children_counter -= 1
		print ("Cc: ",children_counter)
		animal_killed = false
		check_animals_count()



# Being called by CharacterTemplate.gd
func spawn():
	var character_count = characters_list.size() -1
	prev_character = Characters_node.get_child(children_counter-1)
	folder_counter += 1
	if folder_counter > character_count:
		folder_counter = 0
	next_character = load(characters_list[folder_counter]).instance()
	Characters_node.add_child(next_character)
	children_counter +=1
	print("Cc: ", children_counter)
	#next_character.translation = current_charge.get_child(3).translation
	next_character.translation = prev_character.get_child(3).translation
#	last_character = get_last()
#	next_character.translation = last_character.get_child(3).translation


func check_animals_count():
	if children_counter < 1:
		$GameoverTimer.start()
		Global.CameraBody.stop()
#	else:
#		current_charge = get_charge()
#		Global.Character.charge(prev_character,current_charge)

func get_charge():
	for child in Characters_node.get_children():
		if child.alive:
			return child
	#return Characters_node.get_child(charge_counter+1)
	
func get_last():
	var child = 1
	while Characters_node.get_child_count() != null:
		if Characters_node.get_child(Characters_node.get_child_count() - child).alive:
			return Characters_node.get_child(Characters_node.get_child_count() - child)
		else:
			child +=1
	
	
func _on_GameoverTimer_timeout():
	print("GameOver")
	get_tree().change_scene("res://Scene/Ending/Lose.tscn")


# Being called by Home.gd
func home():
	print("Victorious")
	get_tree().change_scene("res://Scene/Ending/Win.tscn")



