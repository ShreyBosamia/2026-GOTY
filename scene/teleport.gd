extends Area3D
@onready var timer = $Timer
@export var dest_scene: PackedScene
var entered_area

func _on_body_entered(body: PhysicsBody3D):
	entered_area = true
	print("entered")
	#timer.start()


func _on_body_exited(body: PhysicsBody3D):
	entered_area = false
	print("exited")
	#timer.end()
	
func _ready():
	entered_area = false
'''
func _on_timer_timeout():
	if entered_area == true and dest_scene:
			get_tree().change_scene_to_packed(dest_scene)
'''

func _process(_delta):
	if entered_area == true and dest_scene:
		if Input.is_action_just_pressed("accept"):
			get_tree().change_scene_to_packed(dest_scene)
