import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exemple_freezed_state.dart';

part 'exemplefreezed_event.dart';

part 'exemple_freezed_bloc.freezed.dart';

class ExempleFreezesBloc
    extends Bloc<ExempleFreezedEvent, ExempleFreezedState> {
  ExempleFreezesBloc() : super(ExempleFreezedState.initial()) {
    on<_ExempleFreezedEventFindNames>(_findNames);
    on<_ExempleFreezedEventAddName>(_addName);
    on<_ExempleFreezedEventRemoveName>(_removeNames);
  }

  FutureOr<void> _addName(
    _ExempleFreezedEventAddName event,
    Emitter<ExempleFreezedState> emit,
  ) async{

    //IMPORTANTE => Sem,pre que usar o EMIT(), está sendo usando um novo estado na tela, podendeo ser que o estado que esta atualmente seja eliminado e
    // algum ponto importante pode ser que se perda na tela, dessa forma precisa sempre verificar sempre a lógica de retorno e contarnar para
    // aparecer o conteudo correto em tela.

    //recuperando os nomes
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    emit(ExempleFreezedState.showBanner(names: names, message: "Aguarde, nome sendo inserido!!!"));
    await Future.delayed(const Duration(seconds: 2));

    final newNames = [...names];
    newNames.add(event.name);

    emit(ExempleFreezedState.data(names: newNames));
  }

  FutureOr<void> _removeNames(
    _ExempleFreezedEventRemoveName event,
    Emitter<ExempleFreezedState> emit,
  ) {
    //novamente recupera os nomes da mesma forma
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    final newNames = [...names];
    newNames.retainWhere((element) => element != event.name);

    emit(ExempleFreezedState.data(names: newNames));
  }

  //Evento para Buscar nomes ao iniciar a tela
  FutureOr<void> _findNames(
    _ExempleFreezedEventFindNames event,
    Emitter<ExempleFreezedState> emit,
  ) async {
    final names = [
      "Fernando Alexande Wahl",
      "Pai",
      "Marido",
      "Desenvolvvedor Java",
      "Desenvolvvedor Flutter",
      "Desenvolvvedor Backend",
    ];
    emit(ExempleFreezedState.loading());
    await Future.delayed(const Duration(seconds: 4));
    emit(ExempleFreezedState.data(names: names));
  }
}
