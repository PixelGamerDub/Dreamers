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
	pass
	
func forcerEtat(_etat : State):
	pass
