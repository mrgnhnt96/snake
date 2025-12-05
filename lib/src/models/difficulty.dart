enum Difficulty {
  easy,
  medium,
  hard;

  const Difficulty();

  (double, double) get mapSize => switch (this) {
    easy => (10, 10),
    medium => (15, 15),
    hard => (20, 20),
  };
}
