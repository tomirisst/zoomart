enum ScreenState { loading, updating, error, done, reading, uploading, none }

extension ScreenStateExt on ScreenState {
  bool get isLoading => this == ScreenState.loading;

  bool get isUpdating => this == ScreenState.updating;

  bool get isDone => this == ScreenState.done;

  bool get isError => this == ScreenState.error;

  bool get isReading => this == ScreenState.reading;

  bool get isUploading => this == ScreenState.uploading;

  bool get isNone => this == ScreenState.none;
}
