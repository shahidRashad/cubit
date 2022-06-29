import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:project_cubit/project_cubit/model/model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  
  void add() => emit(DetailsState(user: state.user));

  void delete(int index){
    state.user.removeAt(index);
    emit(DetailsState(user: state.user));
  }

  void showEdit(index){
    emit(DetailsState(user: state.user, index: index, set: state.set != null ? !state.set! : state.set));
  }

  void updateData(Model model){
    state.user[state.index!] = model;
    emit(DetailsState(user: state.user));
  }

  void setData(
      TextEditingController nameController,
      TextEditingController jobController,
      TextEditingController placeController,
      TextEditingController mobileController) {
    nameController.text = state.user[state.index!].name;
    jobController.text = state.user[state.index!].job;
    placeController.text = state.user[state.index!].place;
    mobileController.text = state.user[state.index!].mobile.toString();
  }
}
