extends KinematicBody

var motion = Vector3() 
const SPEED = 25
const UP = Vector3(0,1,0)

var road=1


func _physics_process(delta):
	$NextPosition.translation.z = self.translation.z -10
	move()
	animate()

# Being called by LevelTemplate.gd
func move():
	if Input.is_action_just_pressed("forward"):
		motion.z = 1
		$MovementTimer.start()
	move_and_slide(motion *SPEED , UP)

func animate():
	if motion.length()>0:
		$AnimationPlayer.play("Armature|Walk")
	else:
		$AnimationPlayer.play("Armature|Idle")


func _on_MovementTimer_timeout():
	motion.z = 0
	$AnimationPlayer.stop()
	road +=1
	onward()
	

func onward():
	if road % 2==0:
		Global.LevelTemplate.spawn()
		

func die(body):
	print("die")
	if body == self:
		$AnimationPlayer.play("Armature|Death")
		Global.LevelTemplate.animal_killed = true
		get_parent().remove_child(self)




