import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tetsu/remote.dart';

part 'remote_state.dart';

class RemoteCubit extends Cubit<RemoteState> {
  RemoteCubit([Remote? initialRemote]) : super(RemoteState(initialRemote));

  void select(Remote remote) {
    emit(RemoteState(remote));
  }

  void unselect() {
    emit(const RemoteState());
  }
}
