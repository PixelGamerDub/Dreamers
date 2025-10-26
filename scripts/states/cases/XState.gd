extends StateCase
class_name XState

signal jouerAnimation(cle : String)

func _init():
	jouable = false
	cleAnimation = StateCase.ETAT_X

func entrer():
	jouerAnimation.emit(cleAnimation)
	pass

func sortir():
	# Plus tard : Jouer l'animation de sortie de vide
	pass

func transitionSelon(move: String) -> String:
	match(move):
		_:
			print("Etat invalide")
			return ""
