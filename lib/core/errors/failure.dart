import 'package:equatable/equatable.dart';

abstract class Failed extends Equatable{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failed {}