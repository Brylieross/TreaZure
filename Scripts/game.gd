extends Node3D

@onready var player = $Player

func _physics_process(delta):
	get_tree().call_group("zombies", "update_target_position", player.position)
