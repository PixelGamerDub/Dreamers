extends PowerUpMineur
class_name Explosion


func _init():
	nom = "Explosion"
	description = "Detruit la case ciblee"

func _ready() -> void:
	nom = "Explosion"
	description = "detruit une case"
	dureeAction = 1
