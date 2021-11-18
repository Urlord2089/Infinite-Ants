extends Area2D

export (int) var speed = 200
var velocity = Vector2()
var screenSize

#Function changes the movement direction of the player according to the key pressed
#Input: none
#Output: none
func getDirection():
	if Input.is_action_pressed("ui_right"):
		if velocity.x == 0:
			velocity.x = speed
			velocity.y = 0		
	elif Input.is_action_pressed("ui_left"):
		if velocity.x == 0:
			velocity.x = -speed
			velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		if velocity.y == 0:
			velocity.x = 0
			velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		if velocity.y == 0:
			velocity.x = 0
			velocity.y = -speed

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	getDirection()
	position += velocity * delta
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)
