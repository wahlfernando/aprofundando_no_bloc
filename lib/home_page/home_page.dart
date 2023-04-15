import 'package:aprofundamento_no_bloc/home_page/button_redirecting.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 162, 187, 199),
      appBar: AppBar(
        title: const Center(child: Text('Bloc a Fundo')),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCard(
                    onTap: () {
                      Navigator.of(context).pushNamed("/bloc/exemple");
                    },
                    text: "Exemplo"),
                ButtonCard(onTap: () {
                  Navigator.of(context).pushNamed("/bloc/exemple/freezed");
                }, text: "Ex. Freezed")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCard(onTap: () {
                  Navigator.of(context).pushNamed("/contacts/list");
                }, text: "Contact"),
                ButtonCard(onTap: () {}, text: "Contact Cubit")
              ],
            )
          ],
        ),
      ),
    );
  }
}
