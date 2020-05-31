extends KinematicBody


var motion = Vector3()
const SPEED = 24.5
const UP = Vector3(0,1,0)
var can_click = true

func _ready():
	Global.CameraBody = self

func _physics_process(delta):
	slide()


func slide():
	if can_click:
		if Input.is_action_just_pressed("forward"):
			can_click = false
			$CMovementTimer.start()
			motion.z = 1
	move_and_slide(motion * SPEED, UP)

# Being called by LevelTemplate.gd (check_animals_count()) , Home.gd(body_entered())
func stop():
	motion.z =0


func _on_CMovementTimer_timeout():
	motion.z = 0
	can_click = true
