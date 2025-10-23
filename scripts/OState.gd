extends StateCase
class_name OState

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_O

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case O")

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass
func transitionSelon(move: String):
	match(move):
		_:
			print("Etat invalide")
