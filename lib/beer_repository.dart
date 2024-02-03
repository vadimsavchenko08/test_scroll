class BeerRepository {
  List<String> getBeers(int page) {
    if (page == 0) {
      return ["beer1","beer2","beer3"];
    } else if (page == 1) {
      return ["beer4","beer5","beer6"];
    } else {
      return ["beer7","beer8","beer9"];
    }
  }
}
