// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_employee_list_transisi/service/api_service.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateInitial());

  void createEmployee(
      String name, String job, String phone, String email) async {
    try {
      emit(CreateLoading());
      Map<String, dynamic> data =
          await ApiService().createEmployee(name, job, phone, email);
      emit(CreateSuccess(data['id']));
    } catch (e) {
      emit(CreateFailed(e.toString()));
    }
  }
}
