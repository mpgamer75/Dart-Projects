import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  List<int> nombres = [];

  print("Comment souhaitez-vous fournir les données ?");
  print("1. Saisir manuellement une liste de nombres.");
  print("2. Importer un jeu de données en ligne.");
  stdout.write("Entrez votre choix (1 ou 2) : ");
  String? choix = stdin.readLineSync();

  if (choix == "1") {
    stdout.write("Entrez une liste de nombres séparés par des virgules : ");
    String? input = stdin.readLineSync();
    nombres = input
            ?.split(',')
            .map((e) => int.tryParse(e.trim()))
            .whereType<int>()
            .toList() ??
        [];
  } else if (choix == "2") {
    stdout.write("Entrez l'URL des données : ");
    String? url = stdin.readLineSync();

    if (url != null && url.isNotEmpty) {
      try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          if (jsonData is List<dynamic>) {
            nombres = jsonData
                .map((e) => int.tryParse(e.toString()))
                .whereType<int>()
                .toList();
          }
        } else {
          print(
              "Erreur lors du téléchargement des données. Code ${response.statusCode}");
        }
      } catch (e) {
        print("Une erreur s'est produite lors de l'importation : $e");
      }
    }
  }

  if (nombres.isEmpty) {
    print(
        "Aucune donnée valide n'a été fournie. Utilisation de la liste par défaut.");
    nombres = [7, 54, -45, 7845, 10, 555, 4, 2136, 87, 3, 0, 87];
  }

  // Créer des copies de la liste pour chaque tri
  List<int> list1 = [...nombres];
  List<int> list2 = [...nombres];
  List<int> list3 = [...nombres];
  List<int> list4 = [...nombres];
  List<int> list5 = [...nombres];
  List<int> list6 = [...nombres];
  List<int> list7 = [...nombres];

  // Tri à bulles
  Stopwatch stopwatch1 = Stopwatch()..start();
  var result1 = bubblesort(list1);
  stopwatch1.stop();
  print("Tri à bulle : ${stopwatch1.elapsedMicroseconds} microsecondes");
  print("Résultat tri à bulle : $result1\n");

  // Tri par sélection
  Stopwatch stopwatch2 = Stopwatch()..start();
  var result2 = selectionsort(list2);
  stopwatch2.stop();
  print("Tri par sélection : ${stopwatch2.elapsedMicroseconds} microsecondes");
  print("Résultat tri par sélection : $result2\n");

  // Tri par insertion
  Stopwatch stopwatch3 = Stopwatch()..start();
  var result3 = insertionsort(list3);
  stopwatch3.stop();
  print("Tri par insertion : ${stopwatch3.elapsedMicroseconds} microsecondes");
  print("Résultat tri par insertion : $result3\n");

  // Quicksort
  Stopwatch stopwatch4 = Stopwatch()..start();
  var result4 = quickSort(list4);
  stopwatch4.stop();
  print("Quicksort : ${stopwatch4.elapsedMicroseconds} microsecondes");
  print("Résultat quicksort : $result4\n");

  // Mergesort
  Stopwatch stopwatch5 = Stopwatch()..start();
  var result5 = mergeSort(list5);
  stopwatch5.stop();
  print("Mergesort : ${stopwatch5.elapsedMicroseconds} microsecondes");
  print("Résultat mergesort : $result5\n");

  // Heapsort
  Stopwatch stopwatch6 = Stopwatch()..start();
  var result6 = heapSort(list6);
  stopwatch6.stop();
  print("Heapsort : ${stopwatch6.elapsedMicroseconds} microsecondes");
  print("Résultat heapsort : $result6\n");

  // Countingsort
  Stopwatch stopwatch7 = Stopwatch()..start();
  var result7 = countingSort(list7);
  stopwatch7.stop();
  print("Countingsort : ${stopwatch7.elapsedMicroseconds} microsecondes");
  print("Résultat countingsort : $result7\n");
}

/// Tri à bulles
///
/// Concept : Cet algorithme compare et échange des éléments adjacents pour placer les plus grands en fin de liste.
/// À chaque itération, le plus grand élément non trié "remonte" à sa position finale.
///
/// Complexité :
/// - Meilleur cas : O(n) (si la liste est déjà triée, avec optimisation non incluse ici)
/// - Pire cas : O(n²) (si la liste est inversée)
/// - Espace : O(1) (tri en place)
List<int> bubblesort(List<int> list) {
  // Parcourir toute la liste
  for (int i = 0; i < list.length - 1; i++) {
    // Parcourir les éléments non triés restants
    for (int j = 0; j < list.length - i - 1; j++) {
      // Si l'élément actuel est plus grand que le suivant, on les échange
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

/// Tri par sélection
///
/// Concept : À chaque itération, cet algorithme sélectionne l'élément minimum parmi les éléments non triés
/// et l'échange avec le premier élément non trié.
///
/// Complexité :
/// - Meilleur cas : O(n²)
/// - Pire cas : O(n²)
/// - Espace : O(1) (tri en place)
List<int> selectionsort(List<int> list) {
  // Parcourir toute la liste sauf le dernier élément
  for (int i = 0; i < list.length - 1; i++) {
    int minIndex = i; // Initialiser l'indice du minimum à i
    // Trouver l'indice de l'élément minimum dans la partie non triée
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j; // Mettre à jour l'indice du minimum
      }
    }
    // Échanger le minimum trouvé avec le premier élément non trié
    int temp = list[i];
    list[i] = list[minIndex];
    list[minIndex] = temp;
  }
  return list;
}

/// Tri par insertion
///
/// Concept : Cet algorithme construit progressivement une partie triée en insérant chaque élément
/// dans sa position correcte par rapport aux éléments déjà triés.
///
/// Complexité :
/// - Meilleur cas : O(n) (si la liste est déjà triée)
/// - Pire cas : O(n²) (si la liste est inversée)
/// - Espace : O(1) (tri en place)
List<int> insertionsort(List<int> list) {
  // Parcourir chaque élément de la liste
  for (int i = 0; i < list.length; i++) {
    int key = list[i]; // Prendre l'élément courant comme "clé"
    int j = i - 1; // Initialiser j à l'indice précédent
    // Déplacer les éléments plus grands que "key" vers la droite
    while (j >= 0 && list[j] > key) {
      list[j + 1] = list[j];
      j = j - 1; // Décrémenter j
    }
    // Placer "key" dans sa position correcte
    list[j + 1] = key;
  }
  return list;
}

/// QuickSort
/// Divise la liste en sous-listes autour d'un pivot, trie les sous-listes et les fusionne.
/// Complexité :
/// - Meilleur cas : O(n log n)
/// - Pire cas : O(n^2) (pivot mal choisi)
/// - Moyenne : O(n log n)
List<int> quickSort(List<int> list) {
  if (list.length <= 1)
    return list; // Une liste vide ou avec un seul élément est déjà triée.

  int pivot = list[list.length ~/ 2]; // On choisit le pivot au milieu.
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  for (var num in list) {
    if (num < pivot) {
      less.add(num);
    } else if (num == pivot) {
      equal.add(num);
    } else {
      greater.add(num);
    }
  }

  // Tri des sous-listes "less" et "greater", puis concaténation avec "equal".
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

/// MergeSort
/// Divise la liste en deux, trie chaque moitié et fusionne les résultats.
/// Complexité :
/// - Meilleur/Moyen/Pire cas : O(n log n)
/// - Nécessite un espace supplémentaire O(n).
List<int> mergeSort(List<int> list) {
  if (list.length <= 1)
    return list; // Une liste vide ou avec un seul élément est déjà triée.

  int mid = list.length ~/ 2; // Trouve le milieu de la liste.
  List<int> left = mergeSort(list.sublist(0, mid)); // Trie la moitié gauche.
  List<int> right = mergeSort(list.sublist(mid)); // Trie la moitié droite.

  return _merge(left, right); // Fusionne les deux moitiés triées.
}

List<int> _merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }

  // Ajout des éléments restants.
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));

  return result;
}

/// HeapSort
/// Utilise une structure de tas binaire pour trier la liste.
/// Complexité :
/// - Meilleur/Moyen/Pire cas : O(n log n)
/// - In-place (pas de mémoire supplémentaire).
List<int> heapSort(List<int> list) {
  int n = list.length;

  // Construire le tas max (heapify).
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    _heapify(list, n, i);
  }

  // Extraire les éléments du tas un par un.
  for (int i = n - 1; i > 0; i--) {
    // Échanger l'élément racine avec le dernier élément.
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;

    // Appliquer heapify sur le sous-tas.
    _heapify(list, i, 0);
  }
  return list;
}

void _heapify(List<int> list, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] > list[largest]) largest = left;
  if (right < n && list[right] > list[largest]) largest = right;

  if (largest != i) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;

    _heapify(list, n, largest);
  }
}

/// Counting Sort
/// Compte les occurrences de chaque élément pour les trier.
/// Complexité :
/// - O(n + k), où k est la plage des valeurs.
/// - Utilisé pour les entiers avec une plage limitée.
List<int> countingSort(List<int> list) {
  if (list.isEmpty) return list;

  int maxVal =
      list.reduce((a, b) => a > b ? a : b); // Trouver la valeur maximale.
  int minVal =
      list.reduce((a, b) => a < b ? a : b); // Trouver la valeur minimale.
  int range = maxVal - minVal + 1;

  List<int> count = List.filled(range, 0); // Tableau de comptage.
  List<int> output = List.filled(list.length, 0);

  // Compter les occurrences de chaque élément.
  for (var num in list) {
    count[num - minVal]++;
  }

  // Calculer les positions cumulées.
  for (int i = 1; i < count.length; i++) {
    count[i] += count[i - 1];
  }

  // Placer les éléments dans la liste triée.
  for (int i = list.length - 1; i >= 0; i--) {
    output[count[list[i] - minVal] - 1] = list[i];
    count[list[i] - minVal]--;
  }

  return output;
}
