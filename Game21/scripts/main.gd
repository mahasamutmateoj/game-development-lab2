extends Node2D

# The balls and walls are scene instances in Main.tscn.
# Clicking creates another instance at the pointer, then Godot runs its physics.
const BALL_SCENE := preload("res://scenes/Ball.tscn")
const MAX_BALLS := 60
const DEMO_POSITIONS := [Vector2(100, 60), Vector2(740, 80), Vector2(300, 70), Vector2(580, 45), Vector2(180, 85), Vector2(620, 65), Vector2(250, 40), Vector2(730, 100)]

var demo_elapsed: float = 0.0
var demo_mode: bool = false
var record_mode: bool = false
var demo_spawn_index: int = 0

func _ready() -> void:
	demo_mode = "--demo" in OS.get_cmdline_user_args()
	record_mode = "--record" in OS.get_cmdline_user_args()

func _process(delta: float) -> void:
	if demo_mode:
		demo_elapsed += delta
		if record_mode:
			var total: float = float(get_tree().get_meta("record_elapsed", 0.0)) + delta
			get_tree().set_meta("record_elapsed", total)
			if total >= 26.0:
				get_tree().quit()
				return
		if demo_spawn_index < DEMO_POSITIONS.size() and demo_elapsed >= float(demo_spawn_index + 1) * 3.0:
			_spawn_ball(DEMO_POSITIONS[demo_spawn_index])
			demo_spawn_index += 1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_spawn_ball(get_global_transform_with_canvas().affine_inverse() * event.position)
		get_viewport().set_input_as_handled()
	elif event is InputEventScreenTouch and event.pressed:
		_spawn_ball(get_global_transform_with_canvas().affine_inverse() * event.position)
		get_viewport().set_input_as_handled()
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_R:
		get_tree().reload_current_scene()

func _spawn_ball(at: Vector2) -> RigidBody2D:
	var count: int = 0
	for child in get_children():
		if child is RigidBody2D:
			count += 1
	if count >= MAX_BALLS:
		return null
	var ball: RigidBody2D = BALL_SCENE.instantiate()
	ball.name = "Ball%d" % (count + 1)
	ball.position = at
	add_child(ball)
	return ball
