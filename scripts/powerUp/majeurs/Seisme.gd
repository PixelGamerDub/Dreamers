extends PowerUpMajeur
class_name Seisme

func _init():
	nom = "Seisme"
	description = "Toutes les cases neutres deviennent fragiles et les fragiles explosent"

func _ready() -> void:
	nom = "Seisme"
	description = "Fragilise toutes les cases vide et detruit toutes les cases deja fragilisee"
	dureeAction = 1
