// null safety ==> evite les erreurs lié aux valeurs null
String? getUserName() => null;

double? divide(int a, int b) => b != 0
    ? a / b
    : null; // si b est différent de 0 alors retourner a/b sinon retourner null

int? multiply(int a, int b) => b.isEven ? (a * b) : null;

void main() {
  double?
      resultat; // enfaite le double? ou int? ou String? veut dire que la variable peut être du type spécifié ou null
  int? resultat2;
  resultat = divide(10, 0);
  resultat2 = multiply(45, 0);

  print(resultat);
  print(resultat2);
}
