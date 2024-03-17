###idle
extends PlayerState


func enter(_msg := {}) -> void:
	pass


func update(_delta: float) -> void:
	###transition on input
	if Input.is_action_just_pressed("forward"):
		state_machine.transition_to("forward")
	if Input.is_action_just_pressed("left"):
		state_machine.transition_to("left")	
	if Input.is_action_just_pressed("right"):
		state_machine.transition_to("right")	
	###
	
	player.velocity.y += -player.gravity
	player.move_and_slide()

func physics_update(_delta: float) -> void:
	pass

func exit():
	pass

func _on_idle_switch_time_timeout():
	pass
