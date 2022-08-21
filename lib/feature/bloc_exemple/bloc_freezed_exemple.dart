import 'package:aprofundamento_no_bloc/feature/bloc_exemple/bloc_freezed/exemple_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFreezedExemple extends StatelessWidget {
  const BlocFreezedExemple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Bloc Freezed Exemple')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<ExempleFreezesBloc>().add(
                const ExempleFreezedEvent.addName('Novo nome na lista'),
              );
        },
      ),
      body: BlocListener<ExempleFreezesBloc, ExempleFreezedState>(
        listener: (context, state) {
          state.whenOrNull(showBanner: (message, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          });
        },
        child: Column(
          children: [
            BlocSelector<ExempleFreezesBloc, ExempleFreezedState, bool>(
                selector: (state) {
              return state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
            }, builder: (context, showLoader) {
              if (showLoader) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            BlocSelector<ExempleFreezesBloc, ExempleFreezedState, List<String>>(
              selector: (state) {
                return state.maybeWhen(
                  data: (names) => names,
                  showBanner: (_, names) => names,
                  orElse: () => <String>[],
                );
              },
              builder: (_, names) {
                debugPrint("Build names ...!!!");
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(names[index]),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
