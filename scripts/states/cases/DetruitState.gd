extends StateCase
class_name DetruitState

signal jouerAnimation(cle : String)

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_DETRUIT

func entrer():
	jouerAnimation.emit(cleAnimation)
	
	pass

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass

func transitionSelon(move: String) -> String:
	match(move):
		Constantes.MOVE_REGEN:
			return StateCase.ETAT_REGEN
		_:
			print("Etat invalide")
			return ""
