###forward
extends PlayerState


var player_moving = false
var player_moved = false


func enter(_msg := {}) -> void:
	player.start_position = player.global_position
	player.target_position.z = player.start_position.z - player.grid_size
	player.target_position.x = player.start_position.x
	player.movement_vector = player.target_position - player.start_position
	player.movement_vector = player.movement_vector.rotated(Vector3.UP, player.get_rotation.y)
	player.new_position = player.global_position + player.movement_vector
	
	player_moving = true
	

func update(_delta: float) -> void:
	pass
	###transition on input
	###


func physics_update(delta: float) -> void:
	if player.global_position != player.new_position && !player_moved:
		player.global_position += (player.movement_vector.normalized() * player.movement_speed) * delta
	if is_equal_approx(player.global_position.z, player.new_position.z) && is_equal_approx(player.global_position.x, player.new_position.x):
		player_moved = true

	player.velocity.y += -player.gravity
	player.move_and_slide()

	####transition on physics
	if player_moved:
		state_machine.transition_to("idle")
	###

func exit():
	player_moving = false
	player_moved = false
	player.start_position = Vector3.ZERO
	player.movement_vector = Vector3.ZERO
	player.target_position = Vector3.ZERO
	player.new_position = Vector3.ZERO

