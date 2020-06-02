extends Spatial

onready var Characters_node = self.get_child(4)

var characters_list ={}
var spawning_character
var folder_pointer = 0
#var children_counter = 1

var animal_killed = false

var living_list
var first_alive
var second_alive
var last_alive


func _ready():
	Global.children_counter = 1
	pause_mode = Node.PAUSE_MODE_PROCESS
	first_alive = Characters_node.get_child(0)
#	print ("ready, FA: " , first_alive)
	Global.LevelTemplate = self
	characters_list = FileGrabber.get_files("res://Scene/characters/actual_characters_folder/")


func _process(delta):
	if animal_killed:
		Global.children_counter -= 1
		print ("Cc: ",Global.children_counter)
		animal_killed = false
		check_animals_count()




# Being called by CharacterTemplate.gd
func spawn():
	var list_size = characters_list.size() -1
	#prev_character = last_alive
	last_alive = Characters_node.get_child(Global.children_counter-1)
	folder_pointer += 1
	if folder_pointer > list_size:
		folder_pointer = 0
	spawning_character = load(characters_list[folder_pointer]).instance()
	Characters_node.add_child(spawning_character)
	spawning_character.translation = last_alive.get_child(3).translation
	Global.children_counter +=1
	print("Cc: ", Global.children_counter)
	print("now spawned", spawning_character)
	# updating last_alive:
	last_alive = spawning_character
	spawning_character.get_instance_id()


func check_animals_count():
	if Global.children_counter < 1:
		$GameoverTimer.start()
		Global.CameraBody.stop()
	else:
		update_order()


func update_order():
	# in case the first/second/last animal  was killed:
	first_alive = Characters_node.get_child(0) #supposed to be 0
	second_alive = Characters_node.get_child(1) #supposed to be 1
	last_alive = Characters_node.get_child(Global.children_counter-1)
#	print("update_order, FA:" , first_alive)
#	print("update_order, SA:" , second_alive)
#	print("update_order, LA:" , last_alive)
#	Global.Character.move_first_alive(first_alive.get_instance_id())



	
func _on_GameoverTimer_timeout():
	print("GameOver")
	get_tree().change_scene("res://Scene/Ending/Lose.tscn")


# Being called by Home.gd
func home():
	print("Victorious")
	Global.score = Global.children_counter
	get_tree().reload_current_scene()
	get_tree().change_scene("res://Scene/Ending/Win.tscn")



