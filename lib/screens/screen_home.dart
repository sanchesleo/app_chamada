import 'package:flutter/material.dart';
import 'package:nac_02_chamada/model/chamada_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listaSemestre = <String> ["1° Semestre","2° Semestre"];
  var semestreEscolhido;

  var listaAula = <String> ["1° Aula","2° Aula","3° Aula","4° Aula","5° Aula","6° Aula","7° Aula","8° Aula","9° Aula","10° Aula"];
  var aulaEscolhida;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 28, 30, 1),
        title: 
        Center(
          child: Image.asset(
            'assets/images/logo-fiap.png',
            fit: BoxFit.cover,
            width: 130,
            alignment: Alignment.center,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(26, 28, 30, 1)
          ),
          child: ListView(
            children: [
              SizedBox(
                    height: 250,
              ),
              Container(
                child: Center(         
                  child: Text(
                    'Selecione a aula que deseja fazer a chamada:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                    height: 70,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:50),
                    child: DropdownButton<String>(
                      hint: Text(
                        "Selecione o Semestre:",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: semestreEscolhido,
                      onChanged: (newValue) {
                        setState(() {
                          semestreEscolhido = newValue;
                        });
                         
                      },
                      items: listaSemestre.map((String semestre) {
                        return DropdownMenuItem<String>(
                          value: semestre,
                          child: Text(
                            semestre,
                            style: TextStyle(
                              color: Color.fromRGBO(237, 20, 91, 1)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: DropdownButton<String>(
                      hint: Text(
                        "Selecione a aula:",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: aulaEscolhida,
                      onChanged: (newValue) {
                        setState(() {
                          aulaEscolhida = newValue;
                        });
                         
                      },
                      items: listaAula.map((String aula) {
                        return DropdownMenuItem<String>(
                          value: aula,
                          child: Text(
                            aula,
                            style: TextStyle(
                              color: Color.fromRGBO(237, 20, 91, 1)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: ElevatedButton.icon(
                      label: Text(
                        'Fazer Chamada',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(237, 20, 91, 1),
                      ),
                      icon: Icon(
                        Icons.account_circle_sharp
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/screen-chamada',
                          arguments: ChamadaModel(semestreEscolhido,aulaEscolhida)
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}