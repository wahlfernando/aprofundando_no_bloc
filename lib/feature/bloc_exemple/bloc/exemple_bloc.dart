import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'exemple_event.dart';

part 'exemple_state.dart';

//esse é o bloc

class ExempleBloc extends Bloc<ExempleEvent, ExempleState> {
  ExempleBloc() : super(ExempleInitial()) {
    //mapeando os eventos - Precisa ter isso se não não invoca a execução do metodo
    on<ExempleFindNameEvent>(_findNames);
    on<ExempleRemoveNameEvent>(_removeNames);
  }

  FutureOr<void> _removeNames(
    ExempleRemoveNameEvent event,
    Emitter<ExempleState> emit,
  ) {
    
    final stateExemple = state;
    if(stateExemple is ExempleStateData){
      final names = [...stateExemple.names]; // basicamente duplica a lista e mostra sempre a lista atual
      names.retainWhere((element) => element != event.name);
      emit(ExempleStateData(names: names));
      
    }

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
      "Desenvolvvedor Java",
      "Desenvolvvedor Flutter",
      "Desenvolvvedor Backend",
    ];

    await Future.delayed(const Duration(seconds: 4));
    emit(ExempleStateData(names: names));
  }
}
