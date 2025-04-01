import 'dart:math';

void main() {
  int numero_random = generate_random_number();
  print("Nombre random: $numero_random");
}

int generate_random_number() {
  Random random = Random();
  int randomNumber = random.nextInt(100);
  return randomNumber;
}

// Exercie à faire ==> génération de nombre random après appuie d'une touche sur clavier et stockage de ce nombre dans une liste dynamic puis tri de la liste avec fonction de tri ( plus petit au plus grand ) et affichage de la liste originale puis triée
