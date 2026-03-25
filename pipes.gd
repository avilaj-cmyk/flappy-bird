extends Node2D

var scroll_speed:int = 3

var has_scored:bool = false

signal get_point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= scroll_speed
	if position.x  <= 100 and has_scored == false:
		emit_signal("get_point")
		has_scored = true
