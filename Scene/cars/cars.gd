extends RigidBody






func _on_Vehicle_body_entered(body):
	if body.collision_layer == 2:
		get_tree().call_group("animals","die",body)



func _on_Timer_timeout():
	$AnimationPlayer.play("drive")
	$Timer.start()
