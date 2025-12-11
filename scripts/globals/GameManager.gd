extends Node
class_name GameManager

var stateMachineManche: StateMachineManche
var stateMachineTour: StateMachineTour
var levier: Button

@onready var partie = {
	1 : {
		"gagnant" : null,
		"powerups" : {
			StateTour.ETAT_TOUR_X : [],
			StateTour.ETAT_TOUR_O : []
		}
	},
	2 : {
		"gagnant" : null,
		"powerups" : {
			StateTour.ETAT_TOUR_X : [],
			StateTour.ETAT_TOUR_O : []
		},
		"powerUpsMajeurs" : null
	},
	3 : {
		"gagnant" : null,
		"powerups" : {
			StateTour.ETAT_TOUR_X : [],
			StateTour.ETAT_TOUR_O : []
		},
		"powerUpsMajeurs" : {
			StateTour.ETAT_TOUR_X : [],
			StateTour.ETAT_TOUR_O : []
		}
	}
}

@onready var caseSelectionnee : Case = null
@onready var tourValide := false

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
	move = Constantes.MOVE_X
	
	tourValide = caseSelectionnee.changerEtat(move)
	
	if not tourValide:
		return

	actualiserCases()
	stateMachineTour.changerEtat(move)

	match(mancheActuelle().verifierConditionsVictoire()):
		StateTour.ETAT_TOUR_X:
			print("Le joueur X a gagné la manche " + str(mancheActuelle().numero) + " !")
			
			partie[mancheActuelle().numero]["gagnant"] = StateTour.ETAT_TOUR_X
			stateMachineTour.forcerEtat(stateMachineTour.getEtat(StateTour.ETAT_TOUR_O))
			stateMachineManche.changerEtat(move)
			get_tree().change_scene_to_file("res://scenes/PowerUp.tscn")
			
		StateTour.ETAT_TOUR_O:
			print("Le joueur O a gagné la manche " + str(mancheActuelle().numero) + " !")
			
			partie[mancheActuelle().numero]["gagnant"] = StateTour.ETAT_TOUR_O
			stateMachineTour.forcerEtat(stateMachineTour.getEtat(StateTour.ETAT_TOUR_X))
			stateMachineManche.changerEtat(move)
			get_tree().change_scene_to_file("res://scenes/PowerUp.tscn")

func actualiserCases():
	var cases = get_tree().get_nodes_in_group("casesg")
	for case in cases:
		if case != caseSelectionnee:
			case.vieillir(mancheActuelle().nbCoupsMax * 2)
			case.reparer()
