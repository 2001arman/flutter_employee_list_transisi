part of 'create_cubit.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class CreateInitial extends CreateState {}

class CreateLoading extends CreateState {}

class CreateSuccess extends CreateState {
  final String id;
  const CreateSuccess(this.id);

  @override
  List<Object> get props => ["Success add data on id: $id"];
}

class CreateFailed extends CreateState {
  final String error;
  const CreateFailed(this.error);

  @override
  List<Object> get props => [error];
}
