import 'dart:developer';

import 'package:flutter/material.dart';

class ExemploUm extends StatelessWidget {
  ExemploUm({Key? key}) : super(key: key);

  //Exemplo simples como ja vimos até agora.
  //Listenable do contador
  final ValueNotifier<int> _contador = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    log('Build Normal');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _contador,
              builder: (BuildContext context, Widget? child) {
                log('Build Especifico');
                return Text('${_contador.value}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                _contador.value++;
              },
              child: const Text('Incrementar'),
            ),
             ElevatedButton(
              onPressed: () {
                _contador.value--;
              },
              child: const Text('Decrementar'),
            )
          ],
        ),
      ),
    );
  }
}
