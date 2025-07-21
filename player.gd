extends CharacterBody3D
@export var speed = 1
var target_velocity = Vector3.ZERO
@onready var animated_sprite: AnimatedSprite3D = $AnimatedSprite3D
var last_direction = Vector3(0, 0, -1) #default to facing south
@onready var camera_3d: Camera3D = $PivotCamera/Camera3D
@onready var camera_pivot: Marker3D = $PivotCamera 
	
func _physics_process(delta):
	var direction = Vector3.ZERO
	
	
	if Input.is_action_pressed("right"):
		direction.x += 1
		
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.z += 1
	if Input.is_action_pressed("up"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed
		
		last_direction = direction 
		var animation_name = "walk_" + get_direction_string(direction)
		animated_sprite.play(animation_name)
		
	else: 
		var animation_name = "idle_" + get_direction_string(last_direction)
		animated_sprite.play(animation_name)
		
	velocity = target_velocity
	move_and_slide()
	
	# Helper function to get the direction as a string (North, NorthEast, etc.)
func get_direction_string(dir: Vector3) -> String:
		# Convert the direction vector to an angle in radians
	var angle = atan2(dir.x, dir.z)  # Note: Z is forward in Godot 3D, X is right/left

	# Convert the angle to degrees and adjust for a -180 to 180 range
	var angle_degrees = rad_to_deg(angle)
	if angle_degrees < 0:
		angle_degrees += 360

	# Map the angle to the 8 directional strings
	if angle_degrees >= 337.5 or angle_degrees < 22.5:
		return "South"
	elif angle_degrees >= 22.5 and angle_degrees < 67.5:
		return "North_East"
	elif angle_degrees >= 67.5 and angle_degrees < 112.5:
		return "East"
	elif angle_degrees >= 112.5 and angle_degrees < 157.5:
		return "South_East"
	elif angle_degrees >= 157.5 and angle_degrees < 202.5:
		return "North"
	elif angle_degrees >= 202.5 and angle_degrees < 247.5:
		return "South_West"
	elif angle_degrees >= 247.5 and angle_degrees < 292.5:
		return "West"
	elif angle_degrees >= 292.5 and angle_degrees < 337.5:
		return "North_West"
	return "South" # Default to facing south if something goes wrong
