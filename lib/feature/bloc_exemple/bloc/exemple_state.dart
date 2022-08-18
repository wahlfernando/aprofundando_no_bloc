part of 'exemple_bloc.dart';



@immutable
abstract class ExempleState {

}

class ExempleInitial extends ExempleState{}

class ExempleStateData extends ExempleState{
  final List<String> names;

  ExempleStateData({required this.names});
}