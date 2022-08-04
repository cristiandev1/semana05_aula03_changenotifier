// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:change_nofitifier/exemplo_dois/pessoa_model.dart';
import 'package:change_nofitifier/exemplo_dois/register_notifier.dart';
import 'package:flutter/material.dart';

class ExemploDois extends StatefulWidget {
  ExemploDois({Key? key}) : super(key: key);

  @override
  State<ExemploDois> createState() => _ExemploDoisState();
}

class _ExemploDoisState extends State<ExemploDois> {
  final PessoaModel _pessoa = PessoaModel(nome: 'Cristian', idade: 17);

  final RegisterNotifier _registerNotifier = RegisterNotifier(false);


  @override
  void initState() {
    _pessoa.addListener(_onListener);
    super.initState();
  }

  _onListener() {
    if (_pessoa.idade >= 18) {
      _registerNotifier.enableRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNofitier Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _pessoa,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    Text('Nome : ${_pessoa.nome}'),
                    Text('Idade : ${_pessoa.idade}'),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                _pessoa.fazerAniversario();
              },
              child: const Text('Fazer aniversario'),
            ),
            ElevatedButton(
              onPressed: () {
                _pessoa.mudarNome(novoNome: 'Dirceu');
              },
              child: const Text('Mudar nome'),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _registerNotifier,
              builder: (BuildContext context, bool valor, Widget? child) {
                if (valor) {
                  return Text('Parabens, agora voce é maior de idade !!');
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
