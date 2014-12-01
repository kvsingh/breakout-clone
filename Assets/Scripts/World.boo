import UnityEngine

class World (MonoBehaviour): 

	public numRows as int
	public numColumns as int
	public numRowsSecondLevel as int
	public startYSecondLevel as int
	public paddleWidth as double = 1.0f
	public paddleHeight as double = 0.5f
	public startTime as double = 0.0f	
	public numBricksHit as int = 0
	public showPause as bool = false
	
	def Start ():
		numRows = 4
		numColumns = 8
		numRowsSecondLevel = 8
		startYSecondLevel = 6
		#numRows = 1
		#numColumns = 4
		startTime = Time.time
		if(Application.loadedLevelName=="Gameplay"):
			for i in range(0,numRows):
				for j in range(0,numColumns):
					k = Random.Range(0, 3)
					if(k==0):
						brick = Instantiate(Resources.Load("brick_red"), Vector3(4+j*paddleWidth+paddleWidth/2, 6+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 50
					if(k==1):
						brick = Instantiate(Resources.Load("brick_green"), Vector3(4+j*paddleWidth+paddleWidth/2, 6+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject	
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 100
					if(k==2):
						brick = Instantiate(Resources.Load("brick_blue"), Vector3(4+j*paddleWidth+paddleWidth/2, 6+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject	
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 200
		else:
			for i in range(0,numRowsSecondLevel):
				numCols as int
				if(i<numRowsSecondLevel/2):
					numCols = 2*(i+1)
				else:
					numCols = 2*(numRowsSecondLevel - i)
				for j in range(0,numCols):
					k = Random.Range(0, 3)
					if(k==0):
						if(i<numRowsSecondLevel/2):
							brick = Instantiate(Resources.Load("brick_red"), Vector3(7-i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject
						else:
							brick = Instantiate(Resources.Load("brick_red"), Vector3(i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject	
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 50
					if(k==1):
						if(i<numRowsSecondLevel/2):						
							brick = Instantiate(Resources.Load("brick_green"), Vector3(7-i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject	
						else:
							brick = Instantiate(Resources.Load("brick_green"), Vector3(i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject		
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 100
					if(k==2):
						if(i<numRowsSecondLevel/2):						
							brick = Instantiate(Resources.Load("brick_blue"), Vector3(7-i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject	
						else:
							brick = Instantiate(Resources.Load("brick_blue"), Vector3(i+j*paddleWidth+paddleWidth/2, startYSecondLevel+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject		
						brickScript = brick.GetComponent("Brick") as Brick
						brickScript.worth = 200
					
	def Update ():
		#Debug.Log("time : " + (Time.time - startTime))
		if(Input.GetKeyDown(KeyCode.P) or Input.GetKeyDown(KeyCode.Escape)):
			if(showPause):
				showPause = false
				Time.timeScale = 1.0
			else:
				showPause = true
				Time.timeScale = 0.0
		if(Input.GetKeyDown(KeyCode.Q)):
			Application.LoadLevel("Menu")
	
		
	def OnGUI():
		if(showPause):
			font as GUIStyle = GUIStyle()
			textureFont as GUIStyle = GUIStyle()
			font.fontSize = 15
			font.normal.textColor = Color.red
			backTexture = Texture2D(128, 128) as Texture2D
			for i in range(128):
				for j in range(128):
					backTexture.SetPixel(i, j, Color.black)
			backTexture.Apply()
			textureFont.normal.background = backTexture
			
			GUI.Box(Rect(200, 150, 260, 250), "", textureFont)			
			GUI.Label(Rect(210,180,150,350), "Game Paused. Press P to \nunpause and Q to quit to menu", font)
			
			GUI.Label(Rect(210,230,150,350), "Move Left \t \t \t \t Left Arrow Key", font)
			GUI.Label(Rect(210,250,150,350), "Move Right \t \t \t \t Right Arrow Key", font)			