extends StateCase
class_name XState

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_X

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case X")

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass
func transitionSelon(move: String):
	match(move):
		_:
			print("Etat invalide")
