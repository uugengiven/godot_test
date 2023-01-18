extends Area2D

export var walk_speed = 400
export var climb_speed = 200

var screen_size
var attacking = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if attacking == false: # I don't like this construction
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
			
		if velocity.x > 0: # moving right
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.play("idle")

		if Input.is_action_pressed("attack"):
			velocity.x = 0
			attacking = true
			$AnimatedSprite.play("stomp")
	
	


func _on_AnimatedSprite_animation_finished():
	#$AnimatedSprite.play("idle")
	attacking = false
