import 'package:flutter/material.dart';
import 'package:nac_02_chamada/model/aluno_model.dart';

class AlunoRepository {


  List<AlunoModel> listAll(){
  var listaAlunos = <AlunoModel>[
    new AlunoModel(
      rm: "1",
      nomeAluno: "Leonardo",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "2",
      nomeAluno: "José",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "3",
      nomeAluno: "Gabriela",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "4",
      nomeAluno: "Isabela",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "5",
      nomeAluno: "João",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "6",
      nomeAluno: "Lucas",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
    new AlunoModel(
      rm: "7",
      nomeAluno: "Beatriz",
      colorPresent: Colors.white,
      colorNotGo: Colors.white
    ),
  ];
    return listaAlunos;
  }
}