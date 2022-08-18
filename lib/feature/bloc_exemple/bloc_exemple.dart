import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc/exemple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExemple extends StatelessWidget {
  const BlocExemple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Bloc exemple')),
        ),
        body: BlocBuilder<ExempleBloc, ExempleState>(
          builder: (context, state) {
            if (state is ExempleStateData) {
              return ListView.builder(
                itemCount: state.names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.names[index]),
                  );
                },
              );
            }
            return Center(child: Text('Nenhum nome cadastrado'));
          },
        ));
  }
}
