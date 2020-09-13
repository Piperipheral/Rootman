extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

export(float) var yOffsetOnSpawn
var initPosition
var yOffset: float
var yTargetPosition: int

var init = true
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.scale = Vector2(0, 0)
	initPosition = self.position
	yOffset = yOffsetOnSpawn
	self.position = (initPosition)

func _process(delta):
	
	if (init):
		if (abs(yOffset) > 0.5):
			yOffset *= 0.95
			var a= yOffsetOnSpawn - yOffset
			self.scale = Vector2(a/yOffsetOnSpawn, a/yOffsetOnSpawn)
		else:
			yOffset = 0
			self.scale = Vector2(1, 1)
			init = false
		self.position = (Vector2(self.position.x, initPosition.y + yOffset))
	else:
		time += delta * 10
		self.position = Vector2(self.position.x, initPosition.y + (cos(time)) * 2 )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
