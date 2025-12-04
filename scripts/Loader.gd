extends Control

func _ready():
	var levier=%Levier
	GameManagerScript.add_child(StateMachineManche.new(),true)
	GameManagerScript.add_child(StateMachineTour.new(),true)
	
	for child in GameManagerScript.get_children():
		if child is StateMachineManche:
			GameManagerScript.stateMachineManche=child
		else:
			GameManagerScript.stateMachineTour=child
			
	GameManagerScript.stateMachineManche.add_child(Manche1State.new())
	GameManagerScript.stateMachineManche.add_child(Manche2State.new())
	GameManagerScript.stateMachineManche.add_child(Manche3State.new())
	
	GameManagerScript.stateMachineTour.add_child(TourXState.new())
	GameManagerScript.stateMachineTour.add_child(TourOState.new())
	GameManagerScript.stateMachineManche.etats={	"": 						null}
	
	for child in(GameManagerScript.stateMachineManche.get_children()):
			if child is Manche1State:
				GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_1]=child
			elif child is Manche2State:
				GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_2]=child
			elif child is Manche3State:
				GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_3]=child
	
	GameManagerScript.stateMachineManche.entrerEtatInitial()
	
	GameManagerScript.levier=levier
	GameManagerScript.levier.pressed.connect(GameManagerScript.jouer)
	for case in get_tree().get_nodes_in_group("casesg"):
		case.focus_entered.connect(GameManagerScript.on_case_focused.bind(case))
		
