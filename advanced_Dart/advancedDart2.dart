void main() async {
  Box<int> holder = Box(123);
  print(holder.value);
  var liste = createList(10, generator);
  print(liste);

  // partie asynchrone

  print("Début");
  String data = await fetchData();
  print(data);

  await for (int value in countStream(10)) {
    print(value);
  }

  await for (int values in countEvenStream(20)) {
    print(values);
  }
}

int generator(int index) {
  // cette fonction générère les éléments de la liste
  return index * 2; // Example generator function
}

List<T> createList<T>(int lentgh, T Function(int) generator) {
  return List.generate(10, generator);
}

/// ok donc en gros les génériques en Dart permettent de créer une instance à travers une classe qui permet de
/// "sauvergarder" des valeurs ou des données ( comme des pointeurs mais juste dansl'idée de prendre et garder une valeur )
///
class Box<T> {
  T value;
  Box(this.value);
}

///Du coup là on a une fonction fetchData() qui avec la classe abstraite Future de Dart nous permet
///de faire du code de manière asynchrone ==> ici fetchData() attend pendant 5 seocndes avant de retourné un string
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 5));
  return "Données chargés";
}

Stream<int> countStream(int max) async* {
  // async* que pour les Stream et yield aussi
  for (int i = 0; i < max; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

Stream<int> countEvenStream(int limite) async* {
  for (int i = 0; i < limite; i++) {
    if (i.isEven) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
