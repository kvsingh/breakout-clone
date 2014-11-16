import UnityEngine

class Ball (MonoBehaviour): 

	public isActive as bool = false
	public position as Vector3
	public force as Vector2
	public paddle as Paddle
	private ballInitialPosition as Vector3
	
	def Start ():
		force = Vector2(400.0f, 200.0f)
		
	def Update ():
		if(isActive is false and (Input.GetKeyDown(KeyCode.LeftArrow) or Input.GetKeyDown(KeyCode.RightArrow))):
			isActive = true
			rigidbody2D.isKinematic = false
			rigidbody2D.AddForce(force)
		elif(isActive and transform.position.y < 1.5):
			isActive = false
			paddle.lives -= 1
			livesWidgetMesh = GameObject.Find("gameplayScreenLivesText").transform.GetComponent("TextMesh") as TextMesh
			livesWidgetMesh.text = paddle.lives.ToString()					
			transform.position.x = paddle.transform.position.x
			transform.position.y = 2.0f
			rigidbody2D.isKinematic = true
		elif(isActive is false):
			transform.position.x = paddle.transform.position.x			