extends StateCase
class_name DetruitState

func _init():
	jouable = true
	cleAnimation = StateCase.ETAT_DETRUIT

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case détruite")

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass
func transitionSelon(move: String):
	match(move):
		"REGEN":
			return StateCase.ETAT_REGEN
		_:
			print("Etat invalide")
