import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: AppGasolina(),
));

class AppGasolina extends StatefulWidget {
  @override
  _AppGasolinaState createState() => _AppGasolinaState();
}

class _AppGasolinaState extends State<AppGasolina> {

  String _resultado = "";

  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _etanolController = TextEditingController();

  void _calcular(){
    final double gasolina = double.tryParse(_gasolinaController.text) ?? 0;
    final double etanol = double.tryParse(_etanolController.text) ?? 0;

    if (gasolina <= 0 || etanol <= 0) {
      setState(() {
        _resultado = "Preencha os valores";
      });
      return;
    }

    final double conta = etanol / gasolina;
    final double porcentagem = conta * 100;

    setState(() {
      if (conta <= 0.7) {
        _resultado =
        "Conta: ${etanol.toStringAsFixed(2)} ÷ ${gasolina.toStringAsFixed(2)} = ${conta.toStringAsFixed(2)}\n"
        "Resultado: ${porcentagem.toStringAsFixed(0)}%\n\n"
        "Compensa usar Etanol";
      } else {
        _resultado =
        "Conta: ${etanol.toStringAsFixed(2)} ÷ ${gasolina.toStringAsFixed(2)} = ${conta.toStringAsFixed(2)}\n"
        "Resultado: ${porcentagem.toStringAsFixed(0)}%\n\n"
        "Compensa usar Gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5),

      appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 119, 157),
          Color(0xFFE91E63),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  title: Text(
    "CALCULADORA DE COMBUSTÍVEL",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
      color: Colors.white,
      shadows: [
        Shadow(
          offset: Offset(1, 2),
          blurRadius: 4,
          color: Colors.black45,
        ),
      ],
    ),
  ),
),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            Text(
              "Bem-vindo à Calculadora de Combustível ✨",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: const Color.fromARGB(134, 255, 37, 106),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Digite os valores de cada um para descobrir qual combustível compensa mais!!!👌",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(135, 255, 80, 135),
              ),
            ),

            SizedBox(height: 24),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE4EC),
                    Color(0xFFFFF0F5),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _gasolinaController,
                decoration: InputDecoration(
                  labelText: "⛽ Valor da gasolina!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE4EC),
                    Color(0xFFFFF0F5),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _etanolController,
                decoration: InputDecoration(
                  labelText: "⛽ Valor do etanol!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            SizedBox(height: 16),

            GestureDetector(
              onTap: _calcular,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF5C8A),
                      Color(0xFFE91E63),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE91E63).withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            if (_resultado.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFFE91E63).withOpacity(0.3)),
                ),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}