extends Node3D

@onready var player = $Player
@onready var spawns = $Spawns
@onready var nav_region = $NavigationRegion3D

var zombie = load("res://Scenes/zombie.tscn")
var instance


func _ready():
	randomize()

func _physics_process(delta):
	get_tree().call_group("zombies", "update_target_position", player.position)


func _get_random_child(parent_node):
	var random_id = randi() % parent_node.get_child_count()
	return parent_node.get_child(random_id)


func _on_spawn_timer_timeout():
	var spawn_point = _get_random_child(spawns).global_position
	instance = zombie.instantiate()
	instance.position = spawn_point
	nav_region.add_child(instance)
