import UnityEngine

class World (MonoBehaviour): 

	public score as int = 0
	public numRows as int = 4
	public numColumns as int = 8
	public paddleWidth as double = 1.0f
	public paddleHeight as double = 0.5f
	def Start ():
		for i in range(0,numRows):
			for j in range(0,numColumns):
				brick = Instantiate(Resources.Load("brick"), Vector3(4+j*paddleWidth+paddleWidth/2, 6+i*paddleHeight+paddleHeight/2, 0), Quaternion.identity) as GameObject
				
	def Update ():
		Debug.Log("score : " + score)