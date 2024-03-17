extends TileMap


var enemies_to_kill = 6


func update(data):
	enemies_to_kill += data
	if enemies_to_kill <= 0:
		$ChangeDoor.show()
		
