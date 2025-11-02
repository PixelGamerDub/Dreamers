extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var stateMachine = $StateMachine
@onready var animatedSprite = $AnimatedSprite2D
@onready var age = 0

func _ready():
	for etat in stateMachine.get_children():
		etat.jouerAnimation.connect(jouerAnimation)

func etatActuel():
	return stateMachine.etatActuel

func getEtat(nomEtat : String) -> StateCase:
	return stateMachine.etats[nomEtat]

func changerEtat(move : String) -> bool:
	var tourValide = stateMachine.changerEtat(move)
	
	if tourValide:
		age = 0
	
	return tourValide

func forcerEtat(nomEtat : String):
	stateMachine.forcerEtat(getEtat(nomEtat))
	age = 0

func symbolesEgaux(case : Case) -> bool:
	return (etatActuel() is XState and case.etatActuel() is XState) or (etatActuel() is OState and case.etatActuel() is OState) 

func jouerAnimation(cle : String):
	animatedSprite.play(cle)

func vieillir(limite : int):
	age += 1
	
	if age >= limite and etatActuel() is not DetruitState and etatActuel() is not RegenState:
		forcerEtat(StateCase.ETAT_VIDE)

func reparer():
	changerEtat(Constantes.MOVE_REGEN)
