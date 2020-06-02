extends Spatial

# Global.score = 0
func _ready():
	pause_mode= Node.PAUSE_MODE_PROCESS

func _on_HomeArea_body_entered(body):
	if body.collision_layer == 2:
		Global.CameraBody.stop()
		get_tree().call_group("animals","go_home",body)
		get_tree().call_group("moving","go_home")
		$ScoreTimer.start()
		


func _on_ScoreTimer_timeout():
	Global.LevelTemplate.home()



