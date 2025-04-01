import 'dart:io';

abstract class Calculable {
  void calculAire();
}

class Form {
  String couleur;
  String envergure;
  Form(this.couleur, this.envergure);
}

class Carre extends Form implements Calculable {
  int cote;

  // Correction du constructeur pour passer les paramètres à la classe parente
  Carre(this.cote, String couleur, String envergure)
      : super(couleur, envergure);

  // Implémentation de la méthode calculAire()
  @override
  void calculAire() {
    int aire = cote * cote;
    print("L'aire du carré est de : $aire");
  }
}

class Triangle extends Form implements Calculable {
  dynamic basee;
  int hauteur;

  Triangle(this.basee, this.hauteur, String couleur, String envergure)
      : super(couleur, envergure);

  @override
  void calculAire() {
    int aire = (basee * hauteur) * 1 / 2;
    print("l\'aire du triangle est de : $aire ");
  }
}

class Rectangle extends Form implements Calculable {
  int longueur;
  int largeur;

  Rectangle(this.longueur, this.largeur, String couleur, String envergure)
      : super(couleur, envergure);

  @override
  void calculAire() {
    int aire = longueur * largeur;
    print("L\'air du rectangle est de $aire");
  }
}

void main() {
  print("==== Menu ====");
  print("Quelle forme souhaitez-vous calculer ?");
  print("1. Rectangle");
  print("2. Carré");
  print("3. Triangle");
  stdout.write("Entrez votre choix (1, 2 ou 3) : ");
  String? choix = stdin.readLineSync();

  switch (choix) {
    case "1":
      stdout.write("Entrez la longueur du rectangle : ");
      int longueur = int.parse(stdin.readLineSync()!);
      stdout.write("Entrez la largeur du rectangle : ");
      int largeur = int.parse(stdin.readLineSync()!);

      var rectangle = Rectangle(longueur, largeur, "rouge", "moyen");
      rectangle.calculAire();
      break;

    case "2":
      stdout.write("Entrez la longueur du côté du carré : ");
      int cote = int.parse(stdin.readLineSync()!);

      var carre = Carre(cote, "bleu", "petit");
      
      carre.calculAire();
      break;

    case "3":
      stdout.write("Entrez la base du triangle : ");
      int base = int.parse(stdin.readLineSync()!);
      stdout.write("Entrez la hauteur du triangle : ");
      int hauteur = int.parse(stdin.readLineSync()!);

      var triangle = Triangle(base, hauteur, "vert", "grand");
      triangle.calculAire();
      break;

    default:
      print("Choix invalide !");
  }
}
