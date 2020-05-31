extends Spatial

# Global.score = 0


func _on_HomeArea_body_entered(body):
	if body.collision_layer == 2:
		Global.score += 1
		Global.CameraBody.stop()
		get_tree().call_group("animals","go_home",body)
		$ScoreTimer.start()
		


func _on_ScoreTimer_timeout():
	Global.LevelTemplate.home()



