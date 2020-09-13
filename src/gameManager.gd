extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var tileTest = preload("res://Assets/Tile_empty_1.tscn")

export var xSpacing = 70
export var ySpacing = 22
var centerScreen = get_viewport_rect().size / 2

export var cooldown = 100
var cooldownTicker = 0
var n = 0
var per = 4

#maybe do object pooling?
func _get_viewport_center() -> Vector2:
	var transform : Transform2D = get_viewport_transform()
	var scale : Vector2 = transform.get_scale()
	return -transform.origin / scale + get_viewport_rect().size / scale / 2
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	centerScreen = _get_viewport_center()
	print (centerScreen)
	pass # Replace with function body.
	
func _input(event):
	if (event.is_action_pressed("ui_right")):
		print ("right")
	if (event.is_action_pressed("ui_left")):
		print ("left")
	if (event.is_action_pressed("ui_up")):
		print ("up")
	
func _process(delta: float) -> void:
	print (cooldownTicker)
	if (cooldownTicker > cooldown):
		cooldownTicker = 0
		if (n < 30):
			n+= 1
			var tile = tileTest.instance()
			tile.position = Vector2(centerScreen.x + (xSpacing * (n%per) + (xSpacing/2 * ((n/per)%2))), centerScreen.y + (ySpacing * (n / per)))
			self.add_child(tile)
	else:
		cooldownTicker += 1
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
