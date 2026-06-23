extends CharacterBody2D

@export var speed := 300.0

func _physics_process(delta):
	var input_direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = input_direction * speed
	move_and_slide()

func _process(delta):
	look_at(get_global_mouse_position())
