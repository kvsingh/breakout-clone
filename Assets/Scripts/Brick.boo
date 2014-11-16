import UnityEngine

class Brick (MonoBehaviour): 

	public worth as int = 50
	public world as World
	def Start ():
		world = GameObject.Find("world").GetComponent("World") as World
	def Update ():
		pass

	def OnCollisionEnter2D(collision as Collision2D):
		if(collision.gameObject.tag=="Ball"):
			world.score = world.score + worth
			scoreWidgetMesh = GameObject.Find("gameplayScreenScoreText").transform.GetComponent("TextMesh") as TextMesh
			scoreWidgetMesh.text = world.score.ToString()		
			Destroy(gameObject)