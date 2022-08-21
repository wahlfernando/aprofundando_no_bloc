import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc/exemple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExemple extends StatelessWidget {
  const BlocExemple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Bloc exemple')),
        ),
        body: BlocListener<ExempleBloc, ExempleState>(
          //listenWhen tem o poder de tomar uma descisão de quando o pedaço do código vai re-buildar, somente quando tiver uma descisão
          listenWhen: ((previous, current) {
            //ex:
            if(previous is ExempleInitial && current is ExempleStateData){
              if(current.names.length > 3) return true;
            }
            return false;
          }),
          listener: (context, state) {
            if (state is ExempleStateData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text("A quantidade de nomes é ${state.names.length}"),
                ),
              );
            }
          },
          child: Column(
            children: [
              BlocSelector<ExempleBloc, ExempleState, bool>(selector: (state) {
                if (state is ExempleInitial) {
                  return true;
                }
                return false;
              }, builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                return const SizedBox.shrink();
              }),
              BlocConsumer<ExempleBloc, ExempleState>(builder: (_, state) {
                if (state is ExempleStateData) {
                  return Text("Toral de nomes é ${state.names.length}");
                }
                return const SizedBox.shrink();
              }, listener: (context, state) {
                debugPrint("Alteração executada");
              }),
              BlocSelector<ExempleBloc, ExempleState, List<String>>(
                  selector: (state) {
                if (state is ExempleStateData) {
                  return state.names;
                }
                return [];
              }, builder: (context, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // context.read<ExempleBloc>().add(ExempleRemoveNameEvent(name: names[index]));
                        context.read<ExempleBloc>().add(ExempleAddNameEvent(name: "String add adicionado"));

                      },
                      title: Text(names[index]),
                    );
                  },
                );
              }),
              // BlocBuilder<ExempleBloc, ExempleState>(
              //   builder: (context, state) {
              //     if (state is ExempleStateData) {
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: state.names.length,
              //         itemBuilder: (context, index) {
              //           return ListTile(
              //             title: Text(state.names[index]),
              //           );
              //         },
              //       );
              //     }
              //     return Center(child: Text('Nenhum nome cadastrado'));
              //   },
              // ),
            ],
          ),
        ));
  }
}
