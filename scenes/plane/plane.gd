extends CharacterBody2D

const GRAVITY:float = 700.0
const JUMP_VELOCITY:float = -400.0

@onready var sprite : AnimatedSprite2D = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = JUMP_VELOCITY


func die() -> void:
	sprite.stop()
	set_physics_process(false)
