extends StaticBody2D

@export var dimensions: Vector2 = Vector2(220.0, 34.0)

func _ready() -> void:
	var shape := RectangleShape2D.new()
	shape.size = dimensions
	$CollisionShape2D.shape = shape
	queue_redraw()

func _draw() -> void:
	var rectangle := Rect2(-dimensions * 0.5, dimensions)
	draw_rect(rectangle, Color("9b6b47"))
	draw_rect(rectangle, Color("624a34"), false, 2.0)
	draw_rect(Rect2(-dimensions * 0.5 + Vector2(2, 2), Vector2(dimensions.x - 4, 5)), Color("628b4b"))
