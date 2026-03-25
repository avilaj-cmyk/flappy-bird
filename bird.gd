extends Area2D

var flap_power:float = 6
var grav:float =10
var velocity:float = 0
var rotatioon_speed:float = 5
	
signal death
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
		rotation += deg_to_rad(rotatioon_speed)
		$AnimatedSprite2D.play("idle")
	elif velocity < 10:
		rotation += deg_to_rad(-rotatioon_speed)
		$AnimatedSprite2D.play("flap")
	else: return
	
	rotation = clamp(rotation, deg_to_rad(-30), deg_to_rad(30))
	
	
func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	
	if area.name == "UpperPipe":
		queue_free()
	if area.name == "LowerPipe":
		queue_free()
