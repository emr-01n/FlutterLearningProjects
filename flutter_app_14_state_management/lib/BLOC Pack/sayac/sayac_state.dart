class SayacState {
  final int sayi;

  SayacState({this.sayi});

  factory SayacState.initial() {
    return SayacState(sayi: 0);
  }
}
