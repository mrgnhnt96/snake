enum Difficulty {
  easy,
  medium,
  hard;

  const Difficulty();

  int get size => switch (this) {
    easy => 10,
    medium => 15,
    hard => 20,
  };

  Duration get speed => switch (this) {
    easy => const Duration(milliseconds: 250),
    medium => const Duration(milliseconds: 150),
    hard => const Duration(milliseconds: 100),
  };
}
