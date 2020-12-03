part of 'main_bloc.dart';

/// model?
class MainState {
  int selectedIndex;
  bool isExtended;

  MainState({this.selectedIndex, this.isExtended});

  MainState.fromJson(Map<String, dynamic> json) {
      selectedIndex = json['selectedIndex'];
      isExtended    = json['isExtended'];
  }

}
