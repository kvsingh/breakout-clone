import UnityEngine

class HighScoreInput (MonoBehaviour): 

	public playerName as string = "Enter name"	
	def Start ():
		pass
		
	def Update ():
		pass

	def OnGUI():
		textureFont as GUIStyle = GUIStyle()
		backTexture = Texture2D(128, 128) as Texture2D
		for i in range(128):
			for j in range(128):
				backTexture.SetPixel(i, j, Color.gray)
		backTexture.Apply()
		textureFont.normal.background = backTexture
		textureFont.fontSize = 30
		textureFont.normal.textColor = Color.red
		
		GUI.Box(Rect(100, 200, 250, 150), "")
		font as GUIStyle = GUIStyle()
		font.fontSize = 30
		font.normal.textColor = Color.red			
		
		GUI.Label(Rect(110, 220, 200, 40), "High Score!", font)
		playerName = GUI.TextField(Rect(110,300,170,40), playerName, textureFont)
		if(GUI.Button(Rect(290, 300, 40, 40), "Go")):										
			highScores as (int) = (0, 0, 0, 0, 0)
			highScoreNames as List = ["", "", "", "", ""]					
			pos as int = -1
			for i in range(0,5):
				highScores[i] = PlayerPrefs.GetInt("highScore-" + i.ToString(), 0)
				highScoreNames[i] = PlayerPrefs.GetString("highScoreName-" + i.ToString(), "")						
				if(highScores[i] < StaticStuff.score):
					pos = i
					break
			Debug.Log("pos : " + pos.ToString())
			for i in range(4, pos, -1):
				highScores[i] = highScores[i-1]							
				highScoreNames[i] = highScoreNames[i-1]
			highScores[pos] = StaticStuff.score
			highScoreNames[pos] = playerName
			for i in range(0,5):
				PlayerPrefs.SetInt("highScore-" + i.ToString(), highScores[i])
				PlayerPrefs.SetString("highScoreName-" + i.ToString(), highScoreNames[i])	
			Application.LoadLevel("HighScore")				