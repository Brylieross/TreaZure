extends Node3D

const speed = 50

@onready var particles = preload("res://Scenes/bullet_gpu_particles_3d.tscn")
@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D
@onready var hitbox = $Area3D/CollisionShape3D

var damage = 1


func _process(delta):
	position += transform.basis * Vector3(0, 0, -speed) * delta


func _on_timer_timeout():
	queue_free()


func _on_area_3d_area_entered(area):
	print("boom")
	mesh.visible = false
	var instance = particles.instantiate()
	instance.position = self.global_position
	instance.emitting = true
	get_parent().add_child(instance)
	area.get_parent().take_damage(1)
	queue_free()
