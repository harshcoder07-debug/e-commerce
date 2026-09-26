class Navigationstate {
  final int selectedindex;
  final bool isnavvisibl;
  Navigationstate({this.selectedindex = 0, this.isnavvisibl = true});
  Navigationstate copyWith({int? selectedindex, bool? isnavvisibl}) {
    return Navigationstate(
      selectedindex: selectedindex ?? this.selectedindex,
      isnavvisibl: isnavvisibl ?? this.isnavvisibl,
    );
  }
}
