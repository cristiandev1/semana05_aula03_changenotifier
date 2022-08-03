import 'package:flutter/material.dart';

class PessoaModel extends ChangeNotifier{

  String nome;
  int idade;

  PessoaModel({required this.nome, required this.idade});


  void fazerAniversario(){
    idade = idade+1;

    //Deixar sem para ver comportamento
    notifyListeners();
  }

  void mudarNome({required String novoNome}){
    nome = novoNome;

    //Deixar sem para ver comportamento
    notifyListeners();
  }
} 