extends CharacterBody2D


@export var speed:int = 50
@export var friction:float = 0
var mod = 1
var input:Vector2 = Vector2.ZERO
var dir = "south"
var moving = false

func _ready():
	$AnimationPlayer.play("idle")
	dir = "south"

func _physics_process(delta):
	move_player()
	
func move_player():
	var input = Input.get_vector("left","right","up","down")
	var inputX = Input.get_action_strength("right") - Input.get_action_strength("left")
	var inputY = Input.get_action_strength("down") - Input.get_action_strength("up")
	if input.x != 0:
		velocity.x += inputX * speed
	elif input.y != 0:
		velocity.y += inputY * speed
	
	set_direction(inputX,inputY)	
	
	if inputX != 0 or inputY != 0:
		friction = 0.5
	else:
		friction = 0.2
			
	velocity.x *= friction
	velocity.y *= friction
	
	animate()
	move_and_slide()

func set_direction(ix,iy):

	if ix > 0 and not moving:
		dir = "east"
	if ix < 0 and not moving:
		dir = "west"
	if iy > 0 and not moving:
		dir = "south"
	if iy < 0 and not moving:
		dir = "north"

func animate():
	if dir == "east":
		if velocity.x > 1:
			$AnimationPlayer.play("east")
			moving = true
		else:
			$AnimationPlayer.play("east-idle")
			moving = false
	if dir == "west":
		if velocity.x < -1:
			$AnimationPlayer.play("west")
			moving = true
		else:
			$AnimationPlayer.play("west-idle")
			moving = false
	if dir == "north":
		if velocity.y < -1:
			$AnimationPlayer.play("north")
			moving = true
		else:
			$AnimationPlayer.play("north-idle")
			moving = false
	if dir == "south":
		if velocity.y > 1:
			$AnimationPlayer.play("south")
			moving = true
		else:
			$AnimationPlayer.play("south-idle")
			moving = false
