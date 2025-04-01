void main() {
  pairs();
  greet(name: "Charles");
  printDetails("Charles");
  liste();
  dictionnaire();

  int resultat1 = multiply(10, 10);
  int resultat2 = multiply2(5, 7);
  bool resultat3 = isEven(10);
  bool resultat4 = isEven2(10);
  bool resultat5 = isEven3(10);

  print(resultat1);
  print(resultat2);
  print(resultat3);
  print(resultat4);
  print(resultat5);
}

void pairs() {
  List<int> nombresPairs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (var n in nombresPairs) {
    if (n % 2 == 0 && n != 0) {
      print(n);
    }
  }
}

// paramètres nommés
void greet({required String name, String message = "Hello"}) {
  print("$message, $name");
}

// paramètres optionels
// pour les paramètres non spécifié il faut mettre au moment du print 2 ?? sinon erreur
void printDetails(String name, [int? age]) {
  print("Name: $name, Age: ${age ?? "Non spécifié"}");
}

int multiply(int a, int b) => a * b;

// Même chose que

int multiply2(int a, int b) {
  return a * b;
}

// fonctions anonymes

// Exercice
bool isEven(int num) {
  if (num.isEven) {
    return true;
  } else {
    return false;
  }
}

// Pareil que
bool isEven2(int num) => num.isEven;
// ou
bool isEven3(int num) => num % 2 == 0;

void liste() {
  List<String> fruits = ["Banane", "Pomme", "Poire"];
  fruits.add("Orange"); // add() ==> rajoute l'élémént à la fin de la liste
  print(fruits);
}

void dictionnaire() {
  Map<String, dynamic> user = {
    "name": "Alice",
    "age": 30,
  };

  print(user["name"]);

// map ( comme dictionnaire sur Python) ne sont pas itérables ==> on itère sur ses entrés ( entries ) ou alors les cles ( keys)
  for (var n in user.values) {
    print(n);
  }

  List<int> mynumbers = [1, 2, 3];
  dynamic list1 = mynumbers.map((n) => n * 2).toList();
  dynamic list2 = mynumbers.map((n) => n * 3).toSet();
  dynamic list3 = mynumbers.where((n) => n > 1).toList();

  print(list1);
  print(list2);
  print(list3);
}
