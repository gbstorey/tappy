extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_lower = $SpawnLower
@onready var spawn_upper = $SpawnUpper

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	new_pipes.position = Vector2(spawn_upper.position.x, y_pos)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout():
	spawn_pipes()
