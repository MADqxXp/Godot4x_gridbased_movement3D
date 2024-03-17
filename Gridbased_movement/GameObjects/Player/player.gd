class_name Player
extends CharacterBody3D

@onready var head = $head

@export var gravity = 50
@export var rotation_speed = 12 ###Rotation speed when turning left or right
@export var movement_speed = 12 ###Attention! Max_speed == 12. movement_speed > 12 may cause some problems!
@export var grid_size = 2.0


###turn left right variables
var actual_rotation := Vector3.ZERO
var target_rotation := Vector3.ZERO
###

###gridbased movement variables
var get_rotation := Vector3.ZERO
var start_position := Vector3.ZERO
var target_position := Vector3.ZERO
var movement_vector := Vector3.ZERO
var new_position := Vector3.ZERO
###


func _physics_process(delta):
	pass
	#print($StateMachine.state)



