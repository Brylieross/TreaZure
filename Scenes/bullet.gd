extends Node3D

const speed = 400

@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D


func _process(delta):
	position += transform.basis * Vector3(0, -speed, 0) * delta
