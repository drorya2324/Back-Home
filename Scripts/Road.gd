extends Spatial






func _on_Area_body_entered(body):
	get_tree().call_group("animals","stop")
	$StopArea.queue_free()
