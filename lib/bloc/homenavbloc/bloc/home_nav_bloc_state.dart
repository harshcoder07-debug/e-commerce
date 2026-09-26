class Navigationstate {
  final int selectedindex;
  final bool? isnavvisibl;
  Navigationstate({this.selectedindex = 0, this.isnavvisibl = true});
  Navigationstate copyWith({int? selectedindex, bool? isnavvisible}) {
    return Navigationstate(
      selectedindex: selectedindex ?? this.selectedindex,
      isnavvisibl: isnavvisible ??this.isnavvisibl 
    );
  }
}
