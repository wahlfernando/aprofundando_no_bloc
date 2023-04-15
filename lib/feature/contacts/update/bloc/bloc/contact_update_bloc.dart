import 'dart:async';
import 'dart:developer';

import 'package:aprofundamento_no_bloc/repositorys/contact_model.dart';
import 'package:aprofundamento_no_bloc/repositorys/contact_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_event.dart';
part 'contact_update_state.dart';
part 'contact_update_bloc.freezed.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState> {
  final ContactsRepository _contactsRepository;

  ContactUpdateBloc({required ContactsRepository contactsRepository})
      : _contactsRepository = contactsRepository,
        super(const _Initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactUpdateState> emit) async {
    try {
  emit(const ContactUpdateState.loading());
  final model = ContactModel(
    id: event.id,
    name: event.name,
    email: event.email,
  );
  
  await _contactsRepository.update(model);
  emit(const ContactUpdateState.success());
} catch (e) {
  log(e.toString());
  emit(const ContactUpdateState.error(message: 'Erro ao atualizar usuário'));
}




  }
}
