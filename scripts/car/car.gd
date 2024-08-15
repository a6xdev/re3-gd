extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300

func _process(delta):
	steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 2.5)
	engine_force = Input.get_axis("break", "run") * ENGINE_POWER

func _enter_tree():
	set_multiplayer_authority(name.to_int())
 
func _physics_process(delta):
	if is_multiplayer_authority():
		steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 2.5)
		engine_force = Input.get_axis("break", "run") * ENGINE_POWER
