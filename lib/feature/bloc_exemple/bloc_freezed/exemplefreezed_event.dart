part of 'exemple_freezed_bloc.dart';

@freezed
class ExempleFreezedEvent with _$ExempleFreezedEvent {
  const factory ExempleFreezedEvent.findNames() = _ExempleFreezedEventFindNames;

  const factory ExempleFreezedEvent.addName(String name) =
      _ExempleFreezedEventAddName;

  const factory ExempleFreezedEvent.removeName(String name) =
      _ExempleFreezedEventRemoveName;
}
