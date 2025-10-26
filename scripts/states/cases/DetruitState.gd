extends StateCase
class_name DetruitState

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_DETRUIT

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case détruite")

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
