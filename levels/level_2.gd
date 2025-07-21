extends Node3D 

@export var spawn_point_path: NodePath 

func _ready():
	# 1. Get the global player instance 
	var player = get_node("/root/Player") 
	
	# 2. Find the spawn point node in the current level
	var spawn_point: Marker3D = null
	if spawn_point_path: 
		spawn_point = get_node(spawn_point_path) as Marker3D
	else: 
		spawn_point = get_node("SpawnPoint") as Marker3D 
		
	# 3. Set the player's global position to the spawn point's global position
	if player and spawn_point:
		player.global_position = spawn_point.global_position
	elif !player:
		print("Error: Player Autoload not found!")
	elif !spawn_point:
		print("Error: SpawnPoint Marker3D not found!")
