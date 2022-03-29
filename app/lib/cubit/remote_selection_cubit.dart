import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tetsu/remote.dart';

part 'remote_selection_state.dart';

class RemoteSelectionCubit extends Cubit<RemoteSelectionState> {
  RemoteSelectionCubit() : super(RemoteSelectionNone());

  void select(Remote remote) {
    emit(RemoteSelectionSome(remote));
  }

  void unselect() {
    emit(RemoteSelectionNone());
  }
}
