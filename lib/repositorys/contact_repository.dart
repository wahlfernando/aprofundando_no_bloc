import 'package:dio/dio.dart';
import 'package:aprofundamento_no_bloc/repositorys/contact_model.dart';

class ContactsRepository {
  ///Todos as formas de Crud estão sendo realizadas da forma mais simples nese versão 1.0
  ///Na versão 2.0 será refeito para utilização do pacote http e com retornos de erros corretos

  Future<List<ContactModel>> findall() async {
    final response = await Dio().get("http://192.168.1.11:8080/contacts");
    return response.data
        ?.map<ContactModel>((contacts) => ContactModel.fromMap(contacts))
        .toList();
  }

  Future<void> create(ContactModel model) =>
      Dio().post('http://192.168.1.11:8080/contacts', data: model.toMap());

  Future<void> update(ContactModel model) =>
      Dio().put('http://192.168.1.11:8080/contacts/${model.id}',
          data: model.toMap());

  Future<void> delete(ContactModel model) =>
      Dio().delete('http://192.168.1.11:8080/contacts/${model.id}');
}