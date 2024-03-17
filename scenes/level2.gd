extends TileMap


var enemies_to_kill = 9

# don't work right now
func update(data):
	enemies_to_kill += data
	if enemies_to_kill <= 0:
		#$ChangeDoor.show()
		pass
			
