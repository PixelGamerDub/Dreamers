extends StateCase
class_name FissureState

func _init():
	jouable = true
	cleAnimation = StateCase.ETAT_FISSURE

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case fissurée")

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass
func transitionSelon(move: String):
	match(move):
		"X":
			return StateCase.ETAT_X
		"O":
			return StateCase.ETAT_O
		"FISSURE":
			return StateCase.ETAT_DETRUIT
		"REGEN":
			return StateCase.ETAT_REGEN
		_:
			print("Etat invalide")
