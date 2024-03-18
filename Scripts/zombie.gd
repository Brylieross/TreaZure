extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.0
var health = 2
var jump_speed = 4
@export var bullet = "res://Scenes/bullet.tscn"


func take_damage(damage):
	health -= damage
	if health < 0:
		queue_free()


func _physics_process(_delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	nav_agent.set_velocity(new_velocity)


func update_target_position(target_location):
	nav_agent.set_target_position(target_location)


func _on_navigation_agent_3d_target_reached():
	velocity.y = jump_speed


func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, .25)
	move_and_slide()
