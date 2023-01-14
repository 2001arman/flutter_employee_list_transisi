// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_employee_list_transisi/models/employee_model.dart';
import 'package:flutter_employee_list_transisi/service/api_service.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  void getEmployee() async {
    try {
      emit(EmployeeLoading());
      var dataEmployee = <DataEmployee>[];
      List<DataEmployee> dataEmployeePage1 =
          await ApiService().getListEmployee(1);
      List<DataEmployee> dataEmployeePage2 =
          await ApiService().getListEmployee(2);
      // disini saya menggabungkan data paginate 1 dan 2
      // karena saya ingin menggunnakan pagination ternyata hanya tersedia 2 page
      // jadi saya langsung ambil 2 page dan menggabungkannya
      dataEmployee.addAll(dataEmployeePage1);
      dataEmployee.addAll(dataEmployeePage2);
      emit(EmployeeSuccess(dataEmployee));
    } catch (e) {
      emit(EmployeeFailed(e.toString()));
    }
  }
}
