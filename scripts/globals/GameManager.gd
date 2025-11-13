extends Node
class_name GameManager

@onready var stateMachineManche := $StateMachineManche
@onready var stateMachineTour := $StateMachineTour
@onready var caseSelectionnee : Case = null
@onready var levier := %Levier
@onready var tourValide := false
@onready var dicoPowerUp= {
	"explosion" : [0,0],
	"volCase" : [0,0],
	"garantie" : [0,0],
	"malediction" : [0,0],
	"miseCroupier" : [0,0],
	"seisme" : [0,0],
	"anchoix" : [0,0]}

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
		move = tourActuel().monMove
	elif rand < mancheActuelle().borne2:
		move = tourActuel().moveAdverse
	elif rand < 1:
		move = Constantes.MOVE_FISSURE
	
	tourValide = caseSelectionnee.changerEtat(move)
	
	if not tourValide:
		return
	
	actualiserCases()
	stateMachineTour.changerEtat(move)
	
	match(mancheActuelle().verifierConditionsVictoire()):
		StateTour.ETAT_TOUR_X:
			print("Le joueur X a gagné la manche " + str(mancheActuelle().numero) + " !")
		StateTour.ETAT_TOUR_O:
			print("Le joueur O a gagné la manche " + str(mancheActuelle().numero) + " !")

func actualiserCases():
	var cases = get_tree().get_nodes_in_group("cases")
	for case in cases:
		if case != caseSelectionnee:
			case.vieillir(mancheActuelle().nbCoupsMax * 2)
			case.reparer()
