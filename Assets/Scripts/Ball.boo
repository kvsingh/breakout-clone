import UnityEngine

class Ball (MonoBehaviour): 

	public isActive as bool = false
	public position as Vector3
	public force as Vector2
	public paddle as Paddle
	private ballInitialPosition as Vector3
	private lastSpeedUp as double = 0.0f
	private speedUpInterval as double = 10.0f
	def Start ():
		force = Vector2(400.0f, 200.0f)		
	def Update ():
		#Debug.Log("velocity : " + rigidbody2D.velocity.magnitude)
		if(Time.time > lastSpeedUp + speedUpInterval and isActive):
			lastSpeedUp = Time.time
			rigidbody2D.AddForce(rigidbody2D.velocity*15)
		if(isActive is false and (Input.GetKeyDown(KeyCode.LeftArrow) or Input.GetKeyDown(KeyCode.RightArrow))):
			isActive = true
			lastSpeedUp = Time.time
			rigidbody2D.isKinematic = false
			rigidbody2D.AddForce(force)
		elif(isActive and transform.position.y < 1.5):
			isActive = false
			paddle.lives -= 1
			if(paddle.lives == 0):
				if(StaticStuff.score > PlayerPrefs.GetInt("highScore-4", 0)):
					Application.LoadLevel("HighScoreInput")
				else:
					Application.LoadLevel("HighScore")
			livesWidgetMesh = GameObject.Find("gameplayScreenLivesText").transform.GetComponent("TextMesh") as TextMesh
			livesWidgetMesh.text = paddle.lives.ToString()					
			transform.position.x = paddle.transform.position.x
			transform.position.y = 2.0f
			rigidbody2D.isKinematic = true
		elif(isActive is false):
			transform.position.x = paddle.transform.position.x			