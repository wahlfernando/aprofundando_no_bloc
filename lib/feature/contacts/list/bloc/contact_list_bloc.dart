import 'package:aprofundamento_no_bloc/repositorys/contact_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repositorys/contact_model.dart';

part 'contatct_list_event.dart';

part 'contact_list_state.dart';

part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  final ContactsRepository _repository;

  ContactListBloc({required ContactsRepository repository})
      : _repository = repository,
        super(ContactListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
  }

  Future<void> _findAll(_ContactListEventFindAll event, Emitter<ContactListState> emit) async {

    try {
      emit(ContactListState.loading());
      final contacts = await _repository.findall();

      emit(ContactListState.data(contacts: contacts));
    } catch (e) {
      debugPrint(e.toString());
      emit(ContactListState.error(error: "Erro ao buscar contatos"));
    }
  }
}
