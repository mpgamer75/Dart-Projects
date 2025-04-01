class Animal {
  void parler() => print("...");
}

class Chien extends Animal {
  @override
  void parler() => print("Woof");
}

// Mixins ==> permet d'ajouter des fonctionnalités à une classe sans héritage

mixin Flyable {
  void fly() => print("je vole ");
}

class Bird extends Animal with Flyable {}

mixin Loggable {
  void log(String message) => print("Log: $message");
}

class User with Loggable {
  String name;
  User(this.name);
}

mixin Swimmable {
  void swim() => print("I can swim in the pool ");
}

class Custommer with Swimmable {}

// Encapsulation et extension

class BankAccount {
  double _balance = 0;

  void deposite(double amount) => _balance += amount;

  double get balance => _balance;
}

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

class Book {
  final String title;
  final String author;

  Book(this.author, this.title);
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) => _books.add(book);
  void removeBook(Book book) =>
      _books.removeWhere((b) => b.title == book.title);

  List<Book> get books => _books;
}

void main() {
  var library = Library();
  library.addBook(Book("Victor Hugo", "Les Misérables"));
  library.addBook(Book("J.K.Rowling", "Harry Potter"));
  for (var book in library.books) {
    print("Title: ${book.title}, Author: ${book.author}");
  }

  library.removeBook(Book("Victor Hugo", "Les Misérables"));
  for (var n in library.books) {
    print("New library : ${n.title}, ${n.author}");
  }
}
