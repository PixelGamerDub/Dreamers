extends PowerUpMineur
class_name Garantie

<<<<<<< Updated upstream
func _init():
	nom = "Garantie"
	description = "Le prochain coup sera forcement du meme symbole que le joeur"
=======
func _ready() -> void:
	nom = "Garantie"
	description = "garantie que le prochain coup soit du meme symbole que le joueur"
>>>>>>> Stashed changes
	dureeAction = 1
