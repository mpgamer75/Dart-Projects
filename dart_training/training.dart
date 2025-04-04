import 'dart:math';
import 'dart:io';
import 'package:path/path.dart as path';

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

void formulaire() async {
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

      case "f":
        if (list.isNotEmpty) {
          sauvegardeFichierTXT(list);
        } else {
          print("Erreur: la liste est vide, impossible de sauvegarder");
        }
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
  print(
    "3. Appuyez sur la touche a pour afficher la liste de nombres non triée",
  );
  print("4. Appuyez sur la touche t pour trier la liste de nombres");
  print("5. Appuyez sur la touche x pour afficher la liste triée");
  print(
    "6. Appuyer sur la touche f pour sauvegarder la liste dans un fichier .txt",
  );
  print("7. Appuyez sur la touche q pour quitter le programme");
  print("================================================");
}

// fonction qui stock la liste trié dans un fichier .txt == > à finir

Future<void> sauvegardeFichierTXT(List<int> donnees) async {
  stdout.write("Entrez le nom du fichier ( ne pas inclure l'extension) : ");
  String? nomFichier = stdin.readLineSync();

  if (nomFichier == null || nomFichier.trim().isEmpty) {
    print("Erreur : le nom du fichier ne peut pas être vide ou null");
    return;
  }

  if (!nomFichier.endsWith('.txt')) {
    nomFichier += '.txt'; // ajoute l'extension si ce n'est pas fait
  }

  final file = File(nomFichier);

  try {
    // Véerification si le fichier existe déjà
    if (await file.exists()) {
      print("Le fichier $nomFichier existe déjà. On l'écrase ? (o/n)");
      String? reponse = stdin.readLineSync();

      if (reponse == null || reponse.toLowerCase() != 'o') {
        print("Sauvegarde annulée");
        return;
      }
    }

    String contenu = donnees.join(
      '\n',
    ); // ici on convertit les données donc les nombres en string
    await file.writeAsString(contenu);
    print("Donné sauvegardées dans le fichier $nomFichier avec succès");
  } catch (e) {
    print("Erreur lors de la sauvegarde des données dans le fichier : $e");
  }
}
// erreurs présntes au niveau de l'import ==> à corriger 
// à finir ==> emplacement du fichier créer 
// Aussi à implémmenter ==> notre propore fonction de tri  en utilisant soit tri par insertion ou tri à bulles
