extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var symbole= $croix
@onready var StateMachine=$StateMachine
var move=Constantes.FRAGILE


func _on_pressed() -> void: #quand la case est clique
	symbole.visible = true #on affiche la croix
