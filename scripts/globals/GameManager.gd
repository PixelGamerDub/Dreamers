extends Node
class_name GameManager

@onready var stateMachineManche := $StateMachineManche
@onready var stateMachineTour := $StateMachineTour
@onready var caseSelectionnee : Case = null
@onready var levier := %Levier

func _ready():
	levier.pressed.connect(jouer)
	
	for case in get_tree().get_nodes_in_group("cases"):
		case.focus_entered.connect(on_case_focused.bind(case))

func on_case_focused(case : Case):
	caseSelectionnee = case

func tourActuel() -> StateTour:
	return stateMachineTour.etatActuel

func mancheActuelle() -> StateManche:
	return stateMachineManche.etatActuel

func jouer():
	if caseSelectionnee == null:
		print("Aucune case sélectionnée !")
		return
	
	# Décider un move aléatoire (à déplacer dans GameManager.gd)
	var move : String
	var rand := randf()
	
	if rand < mancheActuelle().borne1:
		move = Constantes.MOVE_X
	elif rand < mancheActuelle().borne2:
		move = Constantes.MOVE_O
	elif rand < 1:
		move = Constantes.MOVE_FISSURE
	
	caseSelectionnee.changerEtat(move)
	caseSelectionnee.animatedSprite.play(caseSelectionnee.etatActuel().cleAnimation)
	stateMachineTour.changerEtat(move)
	print(mancheActuelle().verifierConditionsVictoire())
