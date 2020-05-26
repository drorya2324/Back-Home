extends KinematicBody



var motion = Vector3()
const SPEED = 25
const UP = Vector3(0,1,0)



func _physics_process(delta):
	move()

func move():
	if Input.is_action_just_pressed("forward"):
		motion.z =1
		$MovementTimer.start()
	move_and_slide(motion * SPEED, UP)

func _on_MovementTimer_timeout():
	motion.z = 0

