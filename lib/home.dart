import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text)?? -1;
    double precoGasolina = double.tryParse(_controllerGasolina.text)?? -1;


    if(precoAlcool < 0) {
      setState(() {
        _textoResultado = "Valor do álcool inválido";
      });
    }

    else if(precoGasolina < 0){
      setState(() {
        _textoResultado = "Valor da gasolina inválido";
      });
    }
    else{
      setState(() {
        _textoResultado = (precoAlcool / precoGasolina) >= 0.7?  "USE GASOLINA":"USE ÁLCOOL";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Saiba qual a melhor opção para abastecer o seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                InputDecoration(labelText: "Preço do Álcool, ex: 1.59"),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                InputDecoration(labelText: "Preço da Gasolina, ex: 3.50"),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
                controller: _controllerGasolina,
              ),

              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                    ),
                    onPressed: _calcular,
                    child: Text(
                      "CALCULAR",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(_textoResultado,
                  style: TextStyle(fontSize: 22,  fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
