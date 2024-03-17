#right
extends PlayerState

var player_rotated = false


func enter(_msg := {}) -> void:
	player.actual_rotation = Vector3(0, player.head.rotation.y, 0)	
	player.target_rotation = Vector3(0, player.actual_rotation.y + deg_to_rad(-90), 0)
	player.get_rotation = player.target_rotation

	

func update(_delta: float) -> void:
	pass
	###transition on input
	###

func physics_update(_delta: float) -> void:
	if player.head.rotation != player.target_rotation && !player_rotated:
		player.head.rotation.y -= deg_to_rad(player.rotation_speed)
		if player.head.rotation.y <= player.target_rotation.y:
			player.head.rotation = player.target_rotation
			if is_equal_approx(player.head.rotation.y, deg_to_rad(-360)):
				player.head.rotation.y = 0
			player_rotated = true

	player.velocity.y += -player.gravity
	player.move_and_slide()

	###transition on physics
	if player_rotated:
		state_machine.transition_to("idle")
	###

func exit():
	print(player.head.rotation)
	player.target_rotation = Vector3.ZERO
	player_rotated = false
