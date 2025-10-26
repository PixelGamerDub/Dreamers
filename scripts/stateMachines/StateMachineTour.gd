extends StateMachine
class_name StateMachineTour

@onready var etats = {
	StateTour.ETAT_TOUR_X:	$TourXState,
	StateTour.ETAT_TOUR_O:	$TourOState,
}

func _ready():
	etatInitial = etats[StateTour.ETAT_TOUR_X]
	etatActuel = etatInitial
	etatInitial.entrer()
	
func changerEtat(_move : String):
	var prochainEtat = etats[etatActuel.transitionSelon(_move)]
	
	# Si le move effectué ne mène à aucun état, ne rien faire
	if prochainEtat == null:
		print("Transition impossible")
		return
	
	# Transition à l'état suivant
	etatActuel.sortir()
	etatActuel = prochainEtat
	etatActuel.entrer()
	
func forcerEtat(etat : State):
	# Si on est déjà dans cet état, ne rien faire
	if etatActuel == etat:
		return
	
	etatActuel.sortir()
	etatActuel = etat
	etatActuel.entrer()
