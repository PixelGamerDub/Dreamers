extends Control

func _ready():
	var levier=%Levier
	GameManagerScript.add_child(StateMachineManche.new(),true)
	GameManagerScript.add_child(StateMachineTour.new(),true)
	for child in GameManagerScript.get_children():
		print(child)
		if child is StateMachineManche:
			GameManagerScript.stateMachineManche=child
		else:
			GameManagerScript.stateMachineTour=child
	print(GameManagerScript.stateMachineManche,GameManagerScript.stateMachineTour)
	print(GameManagerScript.stateMachineManche.etatActuel)
	GameManagerScript.levier=levier
	levier.pressed.connect(GameManagerScript.jouer)
	for case in get_tree().get_nodes_in_group("cases"):
		case.focus_entered.connect(GameManagerScript.on_case_focused.bind(case))
