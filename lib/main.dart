// import vei - do material
import 'package:flutter/material.dart';

//etapa1 - esqueleto da tela
// o objeto vai ser entender a estrutura de um app flutter ne old que sim

void main() => runApp(MaterialApp(
  home: AppGasolina(),
));

class AppGasolina extends StatelessWidget {

  String _resultado = "";
  void _calcular(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // isso aqui eh o esqueleto visual da tela - com a tag <html>
    // local onde ficarao a maioria dos nossos elementos lembra disso viu baby

    // isso parece o header ne mor, poise, é semelhante 
    appBar : AppBar (
      title: Text("Calculadora de Gasolinax⛽")
    ),

  body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        // aqui é onde vao estar nossos elementos viu chuchu (widgets)
      Text(
        "Bem-vindo à Calculadora de Gasolinaa!!!! ⛽⛽",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 24),

       Text(
        "Informe o valor do combustível😽:",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 20),
      TextField (
        decoration: InputDecoration(
          labelText: "Valor da gasolina🧑‍🚒:",
          border: OutlineInputBorder(),

        ),
        keyboardType: TextInputType.number,
      ),
      SizedBox(height: 16),

      TextField (
        decoration: InputDecoration(
          labelText: "Valor do etanol👨‍🚒:",
          border: OutlineInputBorder(),

        ),
        keyboardType: TextInputType.number,
      ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: _calcular,
        child: Text("Calcular"),
      ),
      SizedBox(height:36),
      Text(
        _resultado,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      ],

    ),
  ),


    );
  }
}