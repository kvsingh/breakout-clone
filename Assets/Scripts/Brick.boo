import UnityEngine

class Brick (MonoBehaviour): 

	public worth as int
	public world as World	
	def Start ():
		world = GameObject.Find("world").GetComponent("World") as World
		scoreWidgetMesh = GameObject.Find("gameplayScreenScoreText").transform.GetComponent("TextMesh") as TextMesh
		scoreWidgetMesh.text = StaticStuff.score.ToString()	
			
	def Update ():
		pass

	def OnCollisionEnter2D(collision as Collision2D):
		if(collision.gameObject.tag=="Ball"):
			StaticStuff.score += worth
			scoreWidgetMesh = GameObject.Find("gameplayScreenScoreText").transform.GetComponent("TextMesh") as TextMesh
			scoreWidgetMesh.text = StaticStuff.score.ToString()	
			world.numBricksHit += 1
			if((world.numBricksHit == world.numRows*world.numColumns and Application.loadedLevelName=='Gameplay') or (world.numBricksHit == 40 and Application.loadedLevelName=='Gameplay2')): 
				if(Application.loadedLevelName=='Gameplay'):
					Application.LoadLevel("Gameplay2")
				else:
					if(StaticStuff.score > PlayerPrefs.GetInt("highScore-4", 0)):
						Application.LoadLevel("HighScoreInput")
					else:
						Application.LoadLevel("HighScore")
			Destroy(gameObject)