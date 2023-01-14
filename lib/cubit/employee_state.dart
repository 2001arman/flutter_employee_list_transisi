part of 'employee_cubit.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeSuccess extends EmployeeState {
  final List<DataEmployee> employee;

  const EmployeeSuccess(this.employee);

  @override
  List<Object> get props => [employee];
}

class EmployeeFailed extends EmployeeState {
  final String error;
  const EmployeeFailed(this.error);

  @override
  List<Object> get props => [error];
}
