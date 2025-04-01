class CustomerException implements Exception {
  final String message;
  CustomerException(this.message);
}

void validateAge(int age) {
  if (age < 18 || age < 0 || age > 130)
    throw CustomerException("Erreur, âge invalide");
  else {
    print("Bienvenue");
  }
}

int parseString(String input) {
  int? parsed = int.tryParse(input);
  if (parsed == null) throw FormatException("Invalide input: $input");
  return parsed;
}

void main() {
  try {
    validateAge(18);
  } on CustomerException catch (e) {
    print(e.message);
  }

  try {
    parseString("Charles");
  } on FormatException catch (e) {
    print(e.message);
  }
}
