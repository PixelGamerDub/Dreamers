extends Control

@export var buttonPower : PackedScene

func _ready():
	var levier = %Levier

	GameManagerScript.levier = levier
	GameManagerScript.levier.pressed.connect(GameManagerScript.jouer)
	
	for case in get_tree().get_nodes_in_group("casesg"):
		case.focus_entered.connect(GameManagerScript.on_case_focused.bind(case))
	
	if GameManagerScript.get_child_count() > 0:
		print("Powerups de X")
		for p in GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["powerups"][StateTour.ETAT_TOUR_X]:
			print(p.nom)
		
		print("Powerups de O")
		for p in GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["powerups"][StateTour.ETAT_TOUR_O]:
			print(p.nom)
		
		if GameManagerScript.mancheActuelle().powerUpPresents:
			var gridPowerO: GridContainer = %GridPowerO
			var gridPowerX: GridContainer = %GridPowerX
			
			for powerup in GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["powerups"][StateTour.ETAT_TOUR_X]:
				var bouton = buttonPower.instantiate()
				bouton.text = powerup.nom
				gridPowerX.add_child(bouton)
				
			for powerup in GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["powerups"][StateTour.ETAT_TOUR_O]:
				var bouton = buttonPower.instantiate()
				bouton.text = powerup.nom
				
				# A suivre : rattacher le signal pressed à une fonction du GameManager
				
				gridPowerO.add_child(bouton)
		return
	
	# Création des States Machines
	GameManagerScript.add_child(StateMachineManche.new(),true)
	GameManagerScript.add_child(StateMachineTour.new(),true)
	
	# Initialisation des states machines dans le game manager
	for child in GameManagerScript.get_children():
		if child is StateMachineManche:
			GameManagerScript.stateMachineManche=child
		else:
			GameManagerScript.stateMachineTour=child
		
	# Ajout des états manche
	GameManagerScript.stateMachineManche.add_child(Manche1State.new())
	GameManagerScript.stateMachineManche.add_child(Manche2State.new())
	GameManagerScript.stateMachineManche.add_child(Manche3State.new())
	
	# Ajout des états tour
	GameManagerScript.stateMachineTour.add_child(TourXState.new())
	GameManagerScript.stateMachineTour.add_child(TourOState.new())
	
	for child in (GameManagerScript.stateMachineManche.get_children()):
		if child is Manche1State:
			GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_1] = child
		elif child is Manche2State:
			GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_2] = child
		elif child is Manche3State:
			GameManagerScript.stateMachineManche.etats[StateManche.ETAT_MANCHE_3] = child
	
	GameManagerScript.stateMachineManche.entrerEtatInitial()
	
	for child in (GameManagerScript.stateMachineTour.get_children()):
		if child is TourXState:
			GameManagerScript.stateMachineTour.etats[StateTour.ETAT_TOUR_X] = child
		elif child is TourOState:
			GameManagerScript.stateMachineTour.etats[StateTour.ETAT_TOUR_O] = child
	
	GameManagerScript.stateMachineTour.entrerEtatInitial()
	
	
		
