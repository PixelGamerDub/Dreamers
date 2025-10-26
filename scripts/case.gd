extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var stateMachine = $StateMachine
@onready var animatedSprite = $AnimatedSprite2D
@onready var age = 0

func etatActuel():
	return stateMachine.etatActuel

func getEtat(nomEtat : String) -> StateCase:
	return stateMachine.etats[nomEtat]

func symbolesEgaux(case : Case) -> bool:
	return (etatActuel() is XState and case.etatActuel() is XState) or (etatActuel() is OState and case.etatActuel() is OState) 

func changerEtat(move : String):
	stateMachine.changerEtat(move)
