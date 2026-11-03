import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchAll extends HomeEvent {
  const FetchAll({required this.showError});

  final Function(Object error) showError;

  @override
  List<Object> get props => [showError];
}
