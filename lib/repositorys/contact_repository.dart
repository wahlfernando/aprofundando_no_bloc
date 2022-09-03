import 'package:dio/dio.dart';
import 'package:aprofundamento_no_bloc/repositorys/contact_model.dart';

class ContactsRepository {

  ///Todos as formas de Crud estão sendo realizadas da forma mais simpes nese versão 1.0
  ///Na versão 2.0 será refeito para utilização do pacote http e com retornos de erros corretos

  Future<List<ContactModel>> findall() async{
    final response = await Dio().get('http://192.168.1.9:3031/contacts');

    return response.data?.map<ContactModel>((contacts) => ContactModel.fromMap(contacts)).toList();
  }

  Future<void> create (ContactModel model)  => Dio().post('http://10.0.2.2:3031/contacts', data: model.toMap());

  Future<void> update (ContactModel model)  => Dio().put('http://10.0.2.2:3031/contacts/${model.id}', data: model.toMap());

  Future<void> delete (ContactModel model)  => Dio().delete('http://10.0.2.2:3031/contacts/${model.id}');


}