extends StateMachine
class_name StateMachineManche

@onready var etats = {
	StateManche.ETAT_MANCHE_1:	$Manche1State,
	StateManche.ETAT_MANCHE_2:	$Manche2State,
	StateManche.ETAT_MANCHE_3:	$Manche3State
}

func _ready():
	etatInitial = etats[StateManche.ETAT_MANCHE_1]
	etatActuel = etatInitial
	etatInitial.entrer()
	
func changerEtat(_move : String):
	pass
	
func forcerEtat(_etat : State):
	pass
