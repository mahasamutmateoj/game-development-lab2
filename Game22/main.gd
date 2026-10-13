extends Node

@export var mob_scene: PackedScene
var score := 0

# Recording controls activate only with command-line flags.
var demo := false
var recording := false
var demo_elapsed := 0.0
var round_elapsed := 0.0
var demo_running := false
var demo_collision_sent := false
var demo_restart_at := 2.0

func _ready() -> void:
    demo = "--demo" in OS.get_cmdline_user_args()
    recording = "--record" in OS.get_cmdline_user_args()
    $Player.demo_control = demo
    if demo:
        seed(22339)
    print("GAME22 READY | Dodge the Creeps | demo=", demo)

func game_over() -> void:
    $ScoreTimer.stop()
    $MobTimer.stop()
    $HUD.show_game_over()
    $Music.stop()
    $DeathSound.play()
    demo_running = false
    demo_restart_at = demo_elapsed + 4.0
    print("GAME22 GAME OVER | score=", score)

func new_game() -> void:
    get_tree().call_group("mobs", "queue_free")
    score = 0
    $Player.start($StartPosition.position)
    $StartTimer.start()
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")
    $Music.play()
    round_elapsed = 0.0
    demo_running = true
    demo_collision_sent = false
    print("GAME22 START")

func _on_score_timer_timeout() -> void:
    score += 1
    $HUD.update_score(score)

func _on_start_timer_timeout() -> void:
    $MobTimer.start()
    $ScoreTimer.start()

func _on_mob_timer_timeout() -> void:
    var mob: RigidBody2D = mob_scene.instantiate()
    var mob_spawn_location: PathFollow2D = $MobPath/MobSpawnLocation
    mob_spawn_location.progress_ratio = randf()
    mob.position = mob_spawn_location.position
    var direction := mob_spawn_location.rotation + PI / 2
    direction += randf_range(-PI / 4, PI / 4)
    mob.rotation = direction
    var velocity := Vector2(randf_range(150.0, 250.0), 0.0)
    mob.linear_velocity = velocity.rotated(direction)
    add_child(mob)

func _process(delta: float) -> void:
    if not demo and not recording:
        return
    demo_elapsed += delta
    if recording and demo_elapsed >= 32.0:
        recording = false
        demo = false
        $Music.stop()
        $DeathSound.stop()
        $Music.stream = null
        $DeathSound.stream = null
        await get_tree().process_frame
        get_tree().quit()
        return
    if not demo:
        return
    if not demo_running and demo_elapsed >= demo_restart_at and $HUD/StartButton.visible:
        $HUD._on_start_button_pressed()
    if not demo_running:
        $Player.demo_direction = Vector2.ZERO
        return
    round_elapsed += delta
    _demo_pilot()
    if round_elapsed >= 17.0 and not demo_collision_sent:
        # Real body/area collision demonstrates the tutorial's hit signal.
        demo_collision_sent = true
        var mob: RigidBody2D = mob_scene.instantiate()
        mob.position = $Player.position
        mob.linear_velocity = Vector2.ZERO
        add_child(mob)

func _demo_pilot() -> void:
    var player_pos: Vector2 = $Player.position
    var goal := Vector2(240 + sin(round_elapsed * 0.65) * 125, 375 + cos(round_elapsed * 0.45) * 185)
    var direction: Vector2 = (goal - player_pos).limit_length(90.0) / 90.0
    for mob in get_tree().get_nodes_in_group("mobs"):
        var future: Vector2 = mob.position + mob.linear_velocity * 0.24
        var away: Vector2 = player_pos - future
        var distance := away.length()
        if distance < 135.0 and distance > 0.1:
            direction += away.normalized() * pow((135.0 - distance) / 135.0, 2.0) * 6.0
    if player_pos.x < 58: direction.x += 1.5
    if player_pos.x > 422: direction.x -= 1.5
    if player_pos.y < 100: direction.y += 1.5
    if player_pos.y > 626: direction.y -= 1.5
    $Player.demo_direction = direction.limit_length(1.0)
