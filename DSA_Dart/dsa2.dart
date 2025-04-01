import 'dart:io';

abstract class Bouger {
  void marcher();
  void courir();
  void sauter();
}

class Person {
  String _name;
  int _age;

  Person(this._name, this._age) {
    if (_age < 0) {
      throw ArgumentError("L'âge ne peut pas être négatif");
    } else if (_age < 18) {
      throw ArgumentError("La personne est mineure");
    } else if (_name.isEmpty) {
      throw ArgumentError("Le nom ne peut pas être vide");
    }
  }

  String get name => _name;
  int get age => _age;

  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Le nom ne peut pas être vide (section setters)");
    }
    _name = value;
  }

  set age(int value) {
    if (value < 18) {
      // Simplifié la condition car redondante
      throw ArgumentError("L'âge doit être supérieur ou égal à 18");
    }
    _age = value;
  }

  void greet() {
    print("Hello, my name is $_name and I am $_age years old");
  }
}

class Eleve extends Person implements Bouger {
  int _id;

  Eleve(String name, int age, this._id) : super(name, age) {
    if (_id <= 0) {
      // Validation dans le constructeur
      throw ArgumentError("L'ID doit être strictement positif");
    }
  }

  int get id => _id;

  set id(int value) {
    if (value <= 0) {
      throw ArgumentError("L'ID doit être strictement positif");
    }
    _id = value;
  }

  @override
  void marcher() {
    print("$name marche");
  }

  @override
  void courir() {
    print("$name court"); // Corrigé l'orthographe
  }

  @override
  void sauter() {
    print(
        "$name saute et son badge numéro $id tombe"); // Reformulé pour plus de clarté
  }
}

void demandeUtilisateur() {
  try {
    stdout.write("Entrez le nom de l'élève : ");
    String? nom = stdin.readLineSync();
    if (nom == null || nom.isEmpty) {
      throw ArgumentError("Le nom ne peut pas être vide");
    }

    stdout.write("Entrez l'âge de l'élève : ");
    String? ageStr = stdin.readLineSync();
    int age = int.parse(ageStr ?? '0');

    stdout.write("Entrez l'ID de l'élève : ");
    String? idStr = stdin.readLineSync();
    int id = int.parse(idStr ?? '0');

    var eleve = Eleve(nom, age, id);
    print("\nInformations de l'élève :"); // Ajouté un séparateur
    eleve.greet();
    eleve.marcher();
    eleve.courir();
    eleve.sauter();
  } catch (e) {
    print("\nUne erreur est survenue : $e");
  }
}

void main() {
  demandeUtilisateur();
}
