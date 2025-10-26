extends StateCase
class_name FissureState

signal jouerAnimation(cle : String)

func _init():
	jouable = true
	cleAnimation = StateCase.ETAT_FISSURE

func entrer():
	jouerAnimation.emit(cleAnimation)
	pass

func sortir():
	# Plus tard : Jouer l'animation de sortie de vide
	pass

func transitionSelon(move: String) -> String:
	match(move):
		Constantes.MOVE_X:
			return StateCase.ETAT_X
		Constantes.MOVE_O:
			return StateCase.ETAT_O
		Constantes.MOVE_FISSURE:
			return StateCase.ETAT_DETRUIT
		_:
			print("Etat invalide")
			return ""
