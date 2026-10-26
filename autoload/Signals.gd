extends Node

#signal Mouse_Over(title : String, desc : String)
signal Level_Complete()
signal Player_Death()
signal Next_Level()
signal Set_Spawn(pos : Vector2)
signal Key_Aquired(key : Area2D)

#emitted when the game reaches the credits screen, primarily to switch audio
signal Reach_Credits()
