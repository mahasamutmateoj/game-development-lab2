# Game22 — Dodge the Creeps!

Student: มหาสมุทร แมทิโอ เจแคน — 673380339-5

This project follows all seven chapters of the official Godot **Your first 2D game** tutorial. Only the character artwork and audio have been replaced; the requested student name and ID appear in the footer.

Open `project.godot` in Godot 4 and press F5. Move with arrow keys or WASD. Click **Start** or press **Enter** to start or restart.

The game uses the tutorial's Player Area2D, AnimatedSprite2D walk/up animations, CapsuleShape2D, Mob RigidBody2D, fly/swim/walk animation variants, VisibleOnScreenNotifier2D, rectangle Path2D and PathFollow2D spawn location, MobTimer (0.5 s), ScoreTimer (1 s), StartTimer (2 s), start position (240, 450), HUD score/message/Start button, MessageTimer (2 s), mobs group reset, looping Music and DeathSound.

Survive as long as possible. The score increases by one each second. Enemies move at a random speed of 150–250 pixels per second. Contact with an enemy ends the game.

Original two-frame penguin and red/green/blue slime SVG artwork is under `art/`. Original offline-generated music and game-over WAV files are also under `art/`. The UI uses the tutorial's Xolonium font; Noto Sans Thai is used only for the student footer. Font licenses are under `assets/fonts/`.

Recording: run Godot with `--path PATH_TO_GAME22 -- --demo --record`. The automatic pilot uses the normal game physics and scoring, demonstrates actual enemy collision and restart, and exits after 32 seconds. These flags do not change normal or Web gameplay.

Tutorial: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html
