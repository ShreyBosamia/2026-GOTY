extends Node3D
@export var spawn_point_path: NodePath 

func _ready():
	# Access the Autoloaded player instance
	var player = get_node("/root/Player") 
	
	# Find the spawn point node in the current level
	var spawn_point: Marker3D = null
	if spawn_point_path:
		spawn_point = get_node(spawn_point_path) as Marker3D
	else:
		print("Warning: spawn_point_path not set for level!")
		# Fallback to a default, or handle error
		return
		
	# Set the player's global position to the spawn point's global position
	if is_instance_valid(player) and is_instance_valid(spawn_point):
		player.global_position = spawn_point.global_position
	else:
		print("Error: Player or SpawnPoint not found/valid when placing player.")
