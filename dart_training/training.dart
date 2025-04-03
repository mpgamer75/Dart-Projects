import 'dart:math';
import 'dart:io';

void main() {
  formulaire();
}

int generateRandomNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(1000);
  return randomNumber;
}

// Exercice : génération de nombre random après appui d'une touche sur clavier
// et stockage de ce nombre dans une liste dynamic puis tri de la liste
// avec fonction de tri (plus petit au plus grand) et affichage de la liste originale puis triée

void formulaire() {
  List<int> list = [];
  int? nombre; // avec int? cela permet d'utiliser null ==> null safety
  String? choix = "";

  while (choix != "q") {
    afficherMenu();
    stdout.write("\nEntrez votre choix : ");
    choix = stdin.readLineSync();

    switch (choix) {
      case "g":
        nombre = generateRandomNumber();
        print("Nombre aléatoire généré : $nombre");
        break;
      case "s":
        if (nombre != null) {
          list.add(nombre);
          print("Nombre $nombre stocké dans la liste");
        } else {
          print("Erreur : aucun nombre n'a été généré, recommencez");
        }
        break;
      case "a":
        if (list.isNotEmpty) {
          print("Voici la liste non triée de nombres générés : $list");
        } else {
          print(
            "Erreur : la liste est vide, générez et stockez des nombres d'abord",
          );
        }
        break;
      case "t":
        if (list.isNotEmpty) {
          List<int> originalList = List.from(list);
          list.sort((a, b) => a.compareTo(b));
          print("Liste triée : $list");
          print("Liste originale avant tri : $originalList");
        } else {
          print("Erreur : la liste est vide, impossible de trier");
        }
        break;
      case "x":
        if (list.isNotEmpty) {
          print("Voici la liste triée : $list");
        } else {
          print("Erreur : la liste est vide");
        }
        break;
      case "q":
        print("Programme terminé. Au revoir !");
        break;
      default:
        print("Veuillez entrer une valeur valide (g, s, a, t, x ou q)");
        break;
    }
  }
}

void afficherMenu() {
  print("\n============= Menu ==============");
  print("1. Appuyez sur la touche g pour générer un nombre aléatoire");
  print("2. Appuyez sur la touche s pour stocker le nombre dans une liste");
  print("3. Appuyez sur a pour afficher la liste de nombres non triée");
  print("4. Appuyez sur la touche t pour trier la liste de nombres");
  print("5. Appuyez sur la touche x pour afficher la liste triée");
  print("6. Appuyez sur la touche q pour quitter le programme");
  print("================================================");
}

// fonction qui stock la liste trié dans un fichier .txt == > à finir 

/*void StockageListe(List<int> list){
  File file = File()
}
*/

// Aussi à implémmenter ==> notre propore fonction de tri  en utilisant soit tri par insertion ou tri à bulles 