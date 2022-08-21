part of 'exemple_bloc.dart';

abstract class ExempleEvent {}

class ExempleFindNameEvent extends ExempleEvent {}

class ExempleAddNameEvent extends ExempleEvent {
  final String name;
  ExempleAddNameEvent({required this.name});
}

class ExempleRemoveNameEvent extends ExempleEvent {
  final String name;
  ExempleRemoveNameEvent({required this.name});
}
