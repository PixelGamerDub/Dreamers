extends Node
class_name GameManager
var stateMachineManche:StateMachineManche
var stateMachineTour:StateMachineTour
var levier: Button
@onready var partie = {
	1 : {
		"gagnant" : null
	},
	2 : {
		"gagnant" : null,
		"powerups" : {
			Constantes.MOVE_X : [],
			Constantes.MOVE_O : []
		}
	},
	3 : {
		"gagnant" : null,
		"powerups" : {
			Constantes.MOVE_X : [],
			Constantes.MOVE_O : []
		}
	}
}
@onready var caseSelectionnee : Case = null
@onready var tourValide := false
@onready var dicoPowerUp= {
	"explosion" : [0,0],
	"volCase" : [0,0],
	"garantie" : [0,0],
	"malediction" : [0,0],
	"miseCroupier" : [0,0],
	"seisme" : [0,0],
	"anchoix" : [0,0]}



func on_case_focused(case : Case):
	caseSelectionnee = case
	print(caseSelectionnee)

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
