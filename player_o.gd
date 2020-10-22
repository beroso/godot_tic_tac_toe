tool
extends Node2D

var end_angle := 0.0
export var draw_velocity := 5.0
export var radius := 16.0
export var width := 4.0
export var color := Color.aqua

func _process(delta):
	if end_angle < TAU:
		end_angle += (delta * draw_velocity)
		update()
	elif Engine.editor_hint:
		end_angle = 0.0


func _draw():
	var start_angle := 0.0
	var point_count := 60
	var antialiased := true
	draw_arc(Vector2.ZERO, radius, start_angle, end_angle, point_count, color, width, antialiased)
