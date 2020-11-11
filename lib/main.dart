import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      home: PrimeiraRota(),
    ));

class PrimeiraRota extends StatefulWidget {
  //PrimeiraRota({Key key}) : super(key: key);

  @override
  _PrimeiraRotaState createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  String mensagem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '$mensagem',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Text('Ir Para a Segunda Rota'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaRota()),
                ).then((resposta) {
                  setState(() {
                    mensagem = resposta;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  //const SegundaRota({Key key}) : super(key: key);
  TextEditingController primeiroNumeroController = TextEditingController();
  TextEditingController segundoNumeroController = TextEditingController();
  String resp = '';

  somar() {
    int numero1 = int.tryParse(this.primeiroNumeroController.text);
    int numero2 = int.tryParse(this.segundoNumeroController.text);
    int soma = numero1 + numero2;
    this.resp = '$numero1 + $numero2 = $soma';
    return this.resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Segunda Rota'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(35),
              child: TextField(
                controller: primeiroNumeroController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => primeiroNumeroController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Informe o Primeiro Número'),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.all(35),
              child: TextField(
                controller: segundoNumeroController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => segundoNumeroController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Informe o Segundo Número'),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Voltar Para a Primeira Rota'),
                onPressed: () {
                  Navigator.pop(context, somar());
                },
              ),
            )
          ],
        ));
  }
}
