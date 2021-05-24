import 'package:flutter/material.dart';
import 'package:nac_02_chamada/model/aluno_model.dart';
import 'package:nac_02_chamada/model/chamada_model.dart';
import 'package:nac_02_chamada/repository/aluno_repository.dart';

class ChamadaScreen extends StatefulWidget {
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();
}

class _ChamadaScreenState extends State<ChamadaScreen> {
  Color corAtualPresenca;

  bool isPressedGo = false;
  bool isPressedNotGo = false;
  changeBtnPresent(AlunoModel aluno) {
    setState(() {
      aluno.colorNotGo = Colors.white;
      isPressedGo = !isPressedGo;
      isPressedGo
          ? aluno.colorPresent = Color.fromRGBO(237, 20, 91, 1)
          : aluno.colorPresent = Colors.white;
    });
  }

  changeBtnNotGo(AlunoModel aluno) {
    setState(() {
      isPressedNotGo = !isPressedNotGo;
      isPressedNotGo
          ? aluno.colorNotGo = Color.fromRGBO(237, 20, 91, 1)
          : aluno.colorNotGo = Colors.white;
      aluno.colorPresent = Colors.white;
    });
  }

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
  }

  List<AlunoModel> listaAlunos = AlunoRepository().listAll();
  ChamadaModel aulaData;

  @override
  Widget build(BuildContext context) {
    aulaData = ModalRoute.of(context).settings.arguments;
    String frase;

    if(aulaData.aulaEscolhida == null || aulaData.semestreEscolhido == null){
      frase = '';
    }
    if(aulaData.aulaEscolhida != null && aulaData.semestreEscolhido != null){
      frase = aulaData.semestreEscolhido + ' - ' + aulaData.aulaEscolhida;
    }
    

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 28, 30, 1),
        title: Row(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo-fiap.png',
                fit: BoxFit.cover,
                width: 130,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(width: 50),
            Text(frase,
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(237, 20, 91, 1)))
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
          child: buildListView(listaAlunos),
        ),
        ElevatedButton(
          child: Text(
            'Cadastrar Chamada',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: 
          ElevatedButton.styleFrom(
                primary: Color.fromRGBO(237, 20, 91, 1),
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/screen-chamada-finalizada',
              arguments: aulaData
            );
          },
        )
      ]),
    );
  }

  ListView buildListView(List<AlunoModel> listaHeroes) {
    return ListView.builder(
      controller: _controller,
      itemCount: listaHeroes.length,
      itemBuilder: (BuildContext context, int index) {
        AlunoModel heroesModel = listaHeroes[index];
        return buildCardClass(heroesModel);
      },
    );
  }

  Card buildCardClass(AlunoModel aluno) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        elevation: 12,
        shadowColor: Color.fromRGBO(237, 20, 91, 1),
        color: Color.fromRGBO(26, 28, 30, 1),
        child: ListTile(
          leading: Container(
            height: double.infinity,
            child: Icon(
              Icons.account_circle_sharp,
              color: Color.fromRGBO(237, 20, 91, 1),
            ),
          ),
          title: Text(
            aluno.nomeAluno,
            style: TextStyle(
              color: Color.fromRGBO(237, 20, 91, 1),
            ),
          ),
          subtitle: Text(
            aluno.rm,
            style: TextStyle(
              color: Color.fromRGBO(237, 20, 91, 1),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.check,
                  color: aluno.colorPresent,
                ),
                onPressed: () {
                  changeBtnPresent(aluno);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: aluno.colorNotGo,
                ),
                onPressed: () {
                  changeBtnNotGo(aluno);
                },
              ),
            ],
          ),
        ));
  }
}
