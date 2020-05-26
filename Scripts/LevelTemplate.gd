extends Spatial

onready var Characters_node = self.get_child(3)
onready var prev_character
var characters_list ={}
var next_character
var folder_counter = 0
var children_counter = 0
var animal_killed = false


func _ready():
	Global.LevelTemplate = self
	characters_list = FileGrabber.get_files("res://Scene/characters/actual_characters_folder/")

func _process(delta):
	if animal_killed:
		children_counter -= 1
		animal_killed = false


#func _input(event):
#	if Input.is_action_just_pressed("forward"):
#		$Camera.translation.z +=25

# Being called by CharacterTemplate.gd
func spawn():
	var character_count = characters_list.size() -1
	prev_character = Characters_node.get_child(children_counter)
	folder_counter += 1
	if folder_counter > character_count:
		folder_counter = 0
	next_character = load(characters_list[folder_counter]).instance()
	Characters_node.add_child(next_character)
	children_counter +=1
	next_character.translation = prev_character.get_child(3).translation

func check_animals_count():
	if children_counter < 1:
		game_over()


func game_over():
	pass
