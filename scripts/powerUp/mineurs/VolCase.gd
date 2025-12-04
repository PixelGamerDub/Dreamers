extends PowerUpMineur
class_name VoleCase


func _init():
	nom = "Vol de Case"
	description = "Vole la case ennemie"

func _ready() -> void:
	nom = "VolCase"
	description = "detruit une case"

	dureeAction = 1
