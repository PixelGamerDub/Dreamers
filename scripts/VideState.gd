extends StateCase
class_name VideState

func _init():
	jouable = true
	cleAnimation = "vide"

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	pass

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass
func transitionSelon(move: String):
	match(move):
		"X":
			return "E_X"
		"O":
			return "E_O"
		"FISSURE":
			return "E_FISSURE"
		_:
			print("Etat invalide")
