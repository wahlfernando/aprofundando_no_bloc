import 'dart:async';

import 'package:aprofundamento_no_bloc/repositorys/contact_model.dart';
import 'package:aprofundamento_no_bloc/repositorys/contact_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_state.dart';
part 'contact_register_event.dart';

part 'contact_register_bloc.freezed.dart';

class ContactRegisterBloc
    extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  final ContactsRepository _contactsRepository;

  ContactRegisterBloc({required ContactsRepository contactsRepository})
      : _contactsRepository = contactsRepository,
        super(const ContactRegisterState.initial()) {
    on<_Save>(_save);
  }

  Future<FutureOr<void>> _save(
      _Save event, Emitter<ContactRegisterState> emit) async {
    try {
      emit(const ContactRegisterState.loading());

      await Future.delayed(const Duration(seconds: 1));

      final contactModel = ContactModel(
        name: event.name,
        email: event.email,
      );
      // throw Exception();  // => apenas para testes de erro;
      await _contactsRepository.create(contactModel);
      emit(const ContactRegisterState.success());
    } catch (e) {
      emit(const ContactRegisterState.error(
          message: 'Erro ao salvar um nov ocontato'));
    }
  }
}
