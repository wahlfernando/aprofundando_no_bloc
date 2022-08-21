part of 'exemple_freezed_bloc.dart';

@freezed
class ExempleFreezedState with _$ExempleFreezedState {
  factory ExempleFreezedState.initial() = _$ExempleFreezedStateInitial;

  factory ExempleFreezedState.loading() = _$ExempleFreezedStateLoading;

  factory ExempleFreezedState.showBanner({
    required String message,
    required List<String> names,
  }) = _$ExempleFreezedStateShowBanner;

  factory ExempleFreezedState.data({required List<String> names}) =
      _$ExempleFreezedStateData;
}
