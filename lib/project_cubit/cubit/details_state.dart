part of 'details_cubit.dart';

class DetailsState {
  List<Model> user;
  int? index;
  bool? set;

  DetailsState({required this.user, this.index, this.set = false});
}

class DetailsInitial extends DetailsState {
  DetailsInitial() : super(user: [], set: false);
}
