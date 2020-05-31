extends KinematicBody

var motion = Vector3() 
const SPEED = 25
const UP = Vector3(0,1,0)

var crossed = false
var alive = true
var can_click = true

func _ready():
	Global.Character = self
	animations_settings()
	

func _physics_process(delta):
	$NextPosition.translation.z = self.translation.z -10
	move()
	animate()


func move():
	if alive and can_click:
		if Input.is_action_just_pressed("forward"):
			motion.z = 1
			$MovementTimer.start()
			can_click = false
	move_and_slide(motion *SPEED , UP)

func animations_settings():
	$AnimationPlayer.get_animation("Armature|Idle").set_loop(true)
	$AnimationPlayer.get_animation("Armature|Walk").set_length(1.3)
	$AnimationPlayer.get_animation("Armature|Death").set_loop(false)

func animate():
	if motion.length()>0:
		$AnimationPlayer.play("Armature|Walk")
	elif alive:
		$AnimationPlayer.play("Armature|Idle")


func _on_MovementTimer_timeout():
	motion.z = 0
	can_click = true
	$AnimationPlayer.stop()


# Being called by cars.gd
func die(body):
	if body == self:
		$CollisionShape.disabled = true
		alive = false
		motion.z = 0
		$AnimationPlayer.play("Armature|Death")
		Global.LevelTemplate.animal_killed = true


#Being called by LevelTemplate.gd (check_animals_count())
#func charge(prev_character, current_charge):
#	if current_charge == self:
#		print("I'm incharge")
#		self.move_and_slide(Vector3(0,0,250),UP)
	#self.translation.z = prev_character.translation.z + 10

# Being called by Home.gd
func go_home(body):
	if alive:
		motion.z = 1
		if body == self:
			print("I'm home")
			queue_free()
	move_and_slide(motion * SPEED,UP)




	
