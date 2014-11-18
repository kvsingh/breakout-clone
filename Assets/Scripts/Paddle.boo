import UnityEngine 

class Paddle (MonoBehaviour): 

	public worldWidth as double = 16.0	
	public velocity as double
	private position as Vector3
	public lives as int = 3
			
	def Start ():
		position = transform.position
			
	def Update ():
		horizontalMovement = Input.GetAxis("Horizontal")
		#Debug.Log("lives: " + lives)
		if(horizontalMovement < 0 or horizontalMovement > 0):		
			position.x += horizontalMovement*velocity
			if(position.x < renderer.bounds.size.x/2):
				position.x = renderer.bounds.size.x/2
			elif(position.x > worldWidth - renderer.bounds.size.x/2):
				position.x = worldWidth - renderer.bounds.size.x/2
			transform.position = position
		