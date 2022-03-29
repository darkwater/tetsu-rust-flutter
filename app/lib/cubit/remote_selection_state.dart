part of 'remote_selection_cubit.dart';

@immutable
abstract class RemoteSelectionState {}

class RemoteSelectionNone extends RemoteSelectionState {}

class RemoteSelectionSome extends RemoteSelectionState {
  final Remote remote;

  RemoteSelectionSome(this.remote);
}
