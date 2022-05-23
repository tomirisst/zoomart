import 'base_screen_state.dart';

abstract class BaseViewModel {
  ScreenState state;

  BaseViewModel(this.state);

  bool get isLoading => state.isLoading;

  bool get isDone => state.isDone;

  bool get isError => state.isError;

  bool get isReading => state.isReading;

  bool get isUploading => state.isUploading;

  bool get isNone => state.isNone;
}
