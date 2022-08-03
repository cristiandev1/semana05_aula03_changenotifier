// ignore_for_file: must_be_immutable

import 'package:change_nofitifier/exemplo_dois/pessoa_model.dart';
import 'package:flutter/material.dart';

class ExemploDois extends StatefulWidget {
  ExemploDois({Key? key}) : super(key: key);

  @override
  State<ExemploDois> createState() => _ExemploDoisState();
}

class _ExemploDoisState extends State<ExemploDois> {
  PessoaModel pessoa = PessoaModel(nome: 'Cristian', idade: 17);

  ValueNotifier<bool> cadastrar = ValueNotifier<bool>(false);

  @override
  void initState() {
    pessoa.addListener(() { 
      if(pessoa.idade >= 18){
        cadastrar.value = true;
      }
    });
    super.initState();
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
              animation: pessoa,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    Text('Nome : ${pessoa.nome}'),
                    Text('Idade : ${pessoa.idade}'),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                pessoa.fazerAniversario();

              },
              child: const Text('Fazer aniversario'),
            ),
            ElevatedButton(
              onPressed: () {
                pessoa.mudarNome(novoNome: 'Dirceu');
              },
              child: const Text('Mudar nome'),
            ),

            
            ValueListenableBuilder<bool>(
              valueListenable: cadastrar,
              builder: (BuildContext context, bool valor, Widget? child) {
                if (valor) {
                  return Text('Parabens, agora voce é maior de idade !!');
                  //Qualquer acao poderia ser tomada.
                  //Chamadas de push notification, verificacoes em background etc....
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
