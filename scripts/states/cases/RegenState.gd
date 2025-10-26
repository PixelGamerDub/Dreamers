extends StateCase
class_name RegenState

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_REGEN

func entrer():
	#Plus tard : Jouer l'animation d'arrivée de vide
	print("Case en régénération")

func sortir():
	#Plus tard : Jouer l'animation de sortie de vide
	pass

func transitionSelon(move: String) -> String:
	match(move):
		Constantes.MOVE_REGEN:
			return StateCase.ETAT_VIDE
		_:
			print("Etat invalide")
			return ""
