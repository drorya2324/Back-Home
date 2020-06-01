extends KinematicBody

var motion = Vector3() 
const SPEED = 25
const UP = Vector3(0,1,0)

var crossed = false
var alive = true
var can_click = true
var home = false
var second_alive_died = false
#onready var front_alive



func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	#front_alive = Global.LevelTemplate.Characters_node.get_child(self.get_index()-1).get_child(3).translation.z
	Global.Character = self
	animations_settings()
	

func _physics_process(delta):
	$NextPosition.translation.z = self.translation.z -10
	#if home== false:
	move()
	animate()


func move():
	if alive and can_click:
		if Input.is_action_just_pressed("forward"):
				motion.z = 1
				can_click = false
		elif Global.LevelTemplate.children_counter>2:
			if self!= Global.LevelTemplate.first_alive and self.translation.z < Global.LevelTemplate.Characters_node.get_child(self.get_index()-1).get_child(3).translation.z:
				motion.z = 1
			else:
				stop()
	move_and_slide(motion *SPEED , UP)

func animations_settings():
	$AnimationPlayer.get_animation("Armature|Idle").set_loop(true)
	$AnimationPlayer.get_animation("Armature|Walk").set_length(1.3)
	$AnimationPlayer.get_animation("Armature|Death").set_loop(false)

func stop():
	motion.z = 0
	can_click = true
	$AnimationPlayer.stop()


func animate():
	if motion.length()>0:
		$AnimationPlayer.play("Armature|Walk")
	elif alive:
		$AnimationPlayer.play("Armature|Idle")


# Being called by cars.gd
func die(body):
	if self == body:
		print("im dead,",self)
		body.get_node("DeathTimer").start()
		body.get_node("CollisionShape").disabled = true
		body.alive = false
		body.motion.z = 0
		body.get_node("AnimationPlayer").play("Armature|Death")


# Being called by Home.gd
func go_home(body):
	home = true
	print("home = true")
	if alive:
		motion.z = 1
		if body == self:
			queue_free()
#	$MovementTimer.start()



func _on_DeathTimer_timeout():
	self.get_parent().remove_child(self)
	Global.LevelTemplate.animal_killed = true
	Global.CameraBody.animal_killed = true
	#if second_alive_died:
	#	move_second_alive()
