extends CharacterBody2D

var speed : int
var screen_size : Vector2

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	speed = 200
 

func get_input():
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction.normalized() * speed
	


func _physics_process(_delta):
	#movement here
	get_input()
	move_and_slide()
	
	#set world border
	position = position.clamp(Vector2.ZERO,screen_size)
	
	#play rotation 
	var mouse = get_local_mouse_position()
	var angle = snappedf(mouse.angle() , PI/4) / (PI/4)
	angle = wrapi(int(angle),0,8)
	
	$AnimatedSprite2D.animation = "walk" + str(angle)
	
	#player animation
	if velocity.length() != 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
