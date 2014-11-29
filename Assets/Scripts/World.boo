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
		pass
