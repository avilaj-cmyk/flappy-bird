extends Area2D

var flap_power:float = 5
var grav:float =5
var velocity:float = 0
var rotatioon_speed:float = 5
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + velocity
	
	velocity += grav * delta
	print(position.y)
	
	if Input.is_action_just_pressed("flap"):
		velocity = -flap_power
	else: velocity = velocity
	
	if velocity >= 0:
		rotation += deg_to_rad(1)
	elif velocity < 0:
		rotation += deg_to_rad(-1)
	else: return
	
	rotation = clamp(rotation, deg_to_rad(-30), deg_to_rad(30))
	
