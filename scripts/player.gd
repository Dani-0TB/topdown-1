extends CharacterBody2D


@export var speed:int = 100
@export var friction:float = 0
var mod = 1
var input:Vector2 = Vector2.ZERO


func _physics_process(delta):
	move_player()

func move_player():
	var inputX = Input.get_action_strength("right") - Input.get_action_strength("left")
	var inputY = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if inputX != 0 or inputY != 0:
		friction = 0.5
	else:
		friction = 0.2
	
	velocity.x += inputX * speed
	velocity.y += inputY * speed
			
	velocity.x *= friction
	velocity.y *= friction
	
	move_and_slide()
