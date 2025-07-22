extends Area3D
@onready var timer = $Timer
@export var dest_scene: PackedScene
var entered_area
var time_out 

func _on_body_entered(body: PhysicsBody3D):
	entered_area = true
	print("entered")
	timer.start()


func _on_body_exited(body: PhysicsBody3D):
	entered_area = false
	print("exited")
	timer.stop()
	
func _ready():
	entered_area = false
	time_out = false
	print("time_out is false")


func _process(_delta):
	if time_out and dest_scene:
		#if Input.is_action_just_pressed("accept"):
		get_tree().change_scene_to_packed(dest_scene)


func _on_timer_timeout():
	time_out = true
	print("Time_out is true")
	
