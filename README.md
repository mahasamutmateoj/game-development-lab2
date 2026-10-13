# แบบฝึกหัดที่ 2: Your First 2D Game

**มหาสมุทร แมทิโอ เจแคน · 673380339-5**

โปรเจกต์ Godot 4.7 สำหรับภารกิจ 1 และ 2 พร้อมเกมเวอร์ชันเว็บและวิดีโอสาธิต

## ภารกิจ 1 · Game21 ลูกบอลเด้ง

ฉากลูกบอลตกและเด้งบนแผ่นไม้ตามบทเรียนเรื่อง Scene, Node และ Instance

- `Ball.tscn` ใช้ `RigidBody2D` พร้อมภาพลูกบอลและวงกลมสำหรับตรวจการชน
- `Wall.tscn` ใช้ `StaticBody2D` พร้อมรูปสี่เหลี่ยมสำหรับตรวจการชน และนำไปสร้างหลาย Instance ในฉากหลัก
- กำหนดมวลลูกบอลเป็น 1.2 และค่าเด้งเป็น 0.6 เพื่อสังเกตผลของฟิสิกส์
- ลูกบอลและแผ่นไม้เป็นฉากที่นำกลับมาใช้ซ้ำได้
- คลิกหรือแตะตรงไหนก็สร้างลูกบอลตรงตำแหน่งนั้น แล้วลูกบอลจะตกและเด้งชนแผ่นไม้
- กด **R** เพื่อเริ่มฉากใหม่

## ภารกิจ 2 · Game22 Dodge the Creeps!

เกมหลบศัตรูตามบทเรียน Your First 2D Game ใช้ฉากแนวตั้งและโครงสร้าง Player, Mob, HUD และ Main เปลี่ยนภาพผู้เล่นเป็นเพนกวิน ศัตรูเป็นสไลม์ และเปลี่ยนเสียงประกอบ

- Player รับปุ่มควบคุม เคลื่อนที่ภายในหน้าจอ และส่งสัญญาณเมื่อชนศัตรู
- Mob เคลื่อนที่ผ่านหน้าจอและถูกลบเมื่อออกนอกพื้นที่
- HUD แสดงคะแนน ข้อความ และปุ่ม Start
- Main เริ่มตัวจับเวลา สร้างศัตรู เพิ่มคะแนน และหยุดรอบเมื่อผู้เล่นชนศัตรู
- มีชื่อและรหัสนักศึกษาในเกม
- กด **Start หรือ Enter** แล้วใช้ปุ่ม **ลูกศรหรือ WASD** เพื่อเคลื่อนที่หลบศัตรู

## เปิดโปรเจกต์และเล่นเกม

เปิด `Game21/project.godot` หรือ `Game22/project.godot` ใน Godot 4.7 แล้วกด F5

ไฟล์เกมเวอร์ชันเว็บอยู่ที่ `docs/game21.html` และ `docs/game22.html` โดยต้องเปิดผ่าน HTTP server หรือ GitHub Pages

GitHub Pages ใช้สาขา `main` และโฟลเดอร์ `/docs` ไฟล์เว็บใช้ Compatibility renderer และไม่ต้องใช้ SharedArrayBuffer

## วิดีโอสาธิต

วิดีโออยู่ที่ `docs/videos/game21.mp4` และ `docs/videos/game22.mp4` และเปิดดูผ่านหน้า `game21-video.html` และ `game22-video.html` ได้

วิดีโอบันทึกการทำงานจริงของเกมในโหมดสาธิตอัตโนมัติ ระบบฟิสิกส์ การเคลื่อนที่ และการตรวจการชนทำงานระหว่างบันทึก

## สรุปสิ่งที่เรียนรู้

Scene คือกลุ่ม Node ที่บันทึกเป็นฉาก Node คือส่วนประกอบ เช่น ภาพหรือพื้นที่ตรวจการชน ส่วน Instance คือการนำฉากที่บันทึกไว้มาใช้ในอีกฉากหนึ่ง การแก้ `Wall.tscn` จึงส่งผลต่อ Instance ของฉากนั้น ส่วนค่าที่ปรับเฉพาะ Instance จะใช้ค่าที่กำหนดไว้เฉพาะตัว

Game22 แบ่งหน้าที่ของ Player, Mob, HUD และ Main ตามบทเรียน โดยใช้สัญญาณและตัวจับเวลาเชื่อมการทำงานของแต่ละฉาก

## เอกสารอ้างอิง

- [Godot: Creating instances](https://docs.godotengine.org/en/stable/getting_started/step_by_step/instancing.html)
- [Godot: Your first 2D game](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/01.project_setup.html)
- [Godot: Web export](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html)

ฟอนต์ Noto Sans Thai ใช้ใบอนุญาต SIL Open Font License ซึ่งแนบไว้กับไฟล์ฟอนต์
