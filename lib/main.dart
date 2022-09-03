import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc/exemple_bloc.dart';
import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc_exemple.dart';
import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc_freezed/exemple_freezed_bloc.dart';
import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc_freezed_exemple.dart';
import 'package:aprofundamento_no_bloc/feature/contacts/list/bloc/contact_list_bloc.dart';
import 'package:aprofundamento_no_bloc/feature/contacts/list/contacts_list_page.dart';
import 'package:aprofundamento_no_bloc/repositorys/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactsRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const HomePage(),
        routes: {
          '/home': (_) => const HomePage(),
          '/bloc/exemple': (_) => BlocProvider(
                create: (_) => ExempleBloc()
                  ..add(
                    ExempleFindNameEvent(),
                  ),
                child: const BlocExemple(),
              ),
          '/bloc/exemple/freezed': (_) => BlocProvider(
                create: (context) => ExempleFreezesBloc()
                  ..add(
                    const ExempleFreezedEvent.findNames(),
                  ),
                child: const BlocFreezedExemple(),
              ),
          '/contacts/list': (context) => BlocProvider(
                create: (context) => ContactListBloc(
                    repository: context.read<ContactsRepository>())
                  ..add(const ContactListEvent.findAll()),
                child: const ContactsListPage(),
              ),
        },
      ),
    );
  }
}
