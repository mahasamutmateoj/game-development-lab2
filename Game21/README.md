# Game21 — ภารกิจ 1

แบบฝึกหัด Godot 4 เรื่อง Scenes, Nodes และ Instances แบบเรียบง่ายตามภาพตัวอย่าง: พื้นหลังสีเทา ลูกบอลหน้ายิ้มสีส้ม 6 ลูก และผนัง/ทางลาด 8 ชิ้น

## เปิดและเล่น

เปิด `project.godot` ใน Godot 4 แล้วกด F5 คลิกซ้ายหรือแตะที่ใดก็ได้ภายในเกมเพื่อสร้างลูกบอลตรงตำแหน่งที่คลิก ลูกบอลจะตก เด้ง และชนผนังเอง กด R เพื่อเริ่มใหม่ ไม่มีหน้าจอควบคุมหรือเมนู ขนาดจอ 960 × 540 (จำกัดลูกบอลรวม 60 ลูก)

## สิ่งที่ทำตามโจทย์

- `scenes/Ball.tscn`: ฉากต้นแบบลูกบอล ประกอบด้วย `RigidBody2D`, `Sprite2D` และ `CollisionShape2D`
- เปลี่ยนภาพลูกบอลเป็นภาพหน้ายิ้มที่วาดใหม่ใน `assets/ball.svg`
- เปลี่ยน mass เป็น 1.2, friction เป็น 0.35 และ bounce เป็น 0.6
- `scenes/Main.tscn`: นำ Ball มา instance 6 ครั้ง ค่า gravity scale แต่ละลูกคือ 1, 1.5, 2, 2.5, 3 และ 4
- แยกผนังเป็น `scenes/Wall.tscn` ซึ่งใช้ `StaticBody2D` และ `CollisionShape2D` แล้ว instance 8 ครั้ง
- ผนังประกอบด้วยแนวตั้งซ้าย/ขวา ทางลาดล่างซ้าย/ขวา พื้นแนวนอน 2 ชิ้น และทางลาดรูปตัว V กลับหัวด้านบน 2 ชิ้น
- คลิกหรือแตะเพื่อ instance `Ball.tscn` เพิ่มได้ตรงตำแหน่งที่เลือก โดยไม่มีการบังคับตำแหน่ง ลูกบอลใหม่ใช้ฟิสิกส์เดียวกับฉากต้นแบบ

## โครงสร้างฉาก

```
Main (Node2D)
├── Wall1 … Wall8 (Wall.tscn instances)
└── Ball1 … Ball6 (Ball.tscn instances)

Ball.tscn (RigidBody2D)
├── Sprite2D
└── CollisionShape2D

Wall.tscn (StaticBody2D)
└── CollisionShape2D
```

อ้างอิง: [Godot — Creating instances](https://docs.godotengine.org/en/stable/getting_started/step_by_step/instancing.html)

`--demo` เพิ่มลูกบอลทุก 3 วินาทีผ่านฟังก์ชันเดียวกับการคลิก สำหรับบันทึกวิดีโอตัวอย่างการสร้าง instance การตก และการชน

`--demo --record` หยุดการบันทึกอัตโนมัติเมื่อครบ 26 วินาที

นักศึกษา: มหาสมุทร แมทิโอ เจแคน / 673380339-5
