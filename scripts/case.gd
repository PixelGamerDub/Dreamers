extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var symbole := $Symbole

# Constantes accessibles depuis d'autres scripts (ex : Case.ETAT_FRAGILE)
const ETAT_O := 0
const ETAT_X := 1
const ETAT_FRAGILE := 2
const ETAT_DETRUIT_1 := 3
const ETAT_DETRUIT_2 := 4
const ETAT_DETRUIT_3 := 5


func _on_pressed() -> void:
	symbole.visible = true
