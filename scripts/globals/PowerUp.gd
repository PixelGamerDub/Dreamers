extends Node

class_name PowerUp


var nom : String
var description : String
var dureeAction : int
<<<<<<< Updated upstream

static func listePowerUps(path := "res://scripts/powerUp/"):
	var chemins = listeChemins(path)
	var liste = []
	for chemin in chemins:
		var powerUp = load(chemin)
		liste.append(powerUp.new())
	return liste

static func listePowerUpsMineurs():
	return listePowerUps("res://scripts/powerUp/mineurs/")
	
static func listeCheminsMajeurs():
	return listePowerUps("res://scripts/powerUp/majeurs/")

static func listeCheminsDreamers():
	return listePowerUps("res://scripts/powerUp/dreamers/")

static func listeChemins(path := "res://scripts/powerUp/") -> Array[String]:  
	var file_paths: Array[String] = []  
	var dir = DirAccess.open(path)  
	dir.list_dir_begin()  
	var file_name = dir.get_next()  
	while file_name != "":
		var file_path = path + "/" + file_name  
		if dir.current_is_dir():  
			file_paths += listeChemins(file_path)  
		else:
			if file_path.get_extension() == "gd":  
				file_paths.append(file_path)
		file_name = dir.get_next()  
	return file_paths
=======
static var liste =[PowerUpMajeur]
>>>>>>> Stashed changes

func action():
	pass
	
func _ready():
	pass
