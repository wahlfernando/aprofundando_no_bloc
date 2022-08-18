import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'exemple_event.dart';

part 'exemple_state.dart';

//esse é o bloc

class ExempleBloc extends Bloc<ExempleEvent, ExempleState> {
  ExempleBloc() : super(ExempleInitial()) {
    //mapeando os eventos
    on<ExempleFindNameEvent>(_findNames);
  }

  //Evento para Buscar nomes ao iniciar a tela
  FutureOr<void> _findNames(
    ExempleFindNameEvent event,
    Emitter<ExempleState> emit,
  ) async {

    final names = [
      "Fernando Alexande Wahl",
      "Pai",
      "Marido",
      "Desenvolvvedor",
    ];

    emit(ExempleStateData(names: names));
  }
}
