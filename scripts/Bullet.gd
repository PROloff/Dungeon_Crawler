extends Area2D

const SPEED = 400
var move = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	#input direction
	move = get_global_mouse_position()
	#normalize speed
	if move.length() > 1:
		move *= 1/move.length()

func _process(delta):
	translate(move * delta * SPEED)
	check_for_hit()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _set_playerPosition(var pPosition):
	move = get_global_mouse_position() - pPosition
	
	if move.length() > 1:
		move *= 1/move.length()
	
func check_for_hit():
	for body in get_overlapping_bodies():
		if body.has_method("is_hit"):
			body.is_hit()
			queue_free()