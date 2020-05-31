extends Area


func _on_SpawningArea_body_entered(body):
	if body.collision_layer == 2:
		Global.LevelTemplate.spawn()
		queue_free()


