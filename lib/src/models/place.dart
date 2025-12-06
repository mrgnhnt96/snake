class Place {
  const Place(this.x, this.y);

  final int x;
  final int y;

  @override
  String toString() => '($x, $y)';

  @override
  bool operator ==(Object other) {
    if (other is Place) {
      return x == other.x && y == other.y;
    }
    return false;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
