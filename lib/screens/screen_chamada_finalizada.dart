import 'package:flutter/material.dart';
import 'package:nac_02_chamada/model/chamada_model.dart';

class ChamadaRealizadaScreen extends StatefulWidget {
  @override
  _ChamadaRealizadaScreenState createState() => _ChamadaRealizadaScreenState();
}

class _ChamadaRealizadaScreenState extends State<ChamadaRealizadaScreen> {
  @override
  Widget build(BuildContext context) {
    ChamadaModel aulaData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 28, 30, 1),
        title: Center(
          child: Image.asset(
            'assets/images/logo-fiap.png',
            fit: BoxFit.cover,
            width: 130,
            alignment: Alignment.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: buildPaddingFinished(context, aulaData),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(26, 28, 30, 1)),
                      ),
                    );
                  } else {
                    return snapshot.data;
                  }
                }),
          ),
        ],
      ),
    );
  }
  String frase;
  Future<ListView> buildPaddingFinished(
      BuildContext context, ChamadaModel aulaData) async {
      if(aulaData.aulaEscolhida == null || aulaData.semestreEscolhido == null){
       frase = 'Aula Cadastrada!';
      }
      if(aulaData.aulaEscolhida != null && aulaData.semestreEscolhido != null){
        frase = aulaData.aulaEscolhida + ' do ' + aulaData.semestreEscolhido + ' cadastrada!';
      }
    await Future.delayed(Duration(seconds: 3));
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            height: 800,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(26, 28, 30, 1)),
            child: ListView(
              children: [
                SizedBox(
                  height: 300,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                       frase,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(237, 20, 91, 1)),
                  child: Text(
                    'Nova Chamada',
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                  },
                )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
