extends KinematicBody

var motion = Vector3()
const UP = Vector3(0,1,0)
var speed
var w_time
var start_pos
# SuperSpeed Vars
var S_speed
var SW_time


func _physics_process(delta):
	motion.x = -1
	if Global.SuperSpeed:
		move_and_slide(motion * S_speed, UP)
	else:
		move_and_slide(motion * speed, UP)
	


func _on_Vehicle_body_entered(body):
	if body.collision_layer == 2:
		print("I'm ", self, "killing ", body)
		self.get_node("CollisionShape").disabled = true
		self.get_node("Area/CollisionShape2").disabled = true
		get_tree().call_group("animals","die",body)
	#	if body == Global.LevelTemplate.second_alive:
	#		Global.Character.second_alive_died = true


func _on_Timer_timeout():
	translation = start_pos

