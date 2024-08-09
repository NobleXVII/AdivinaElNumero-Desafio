import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adivina_el_numero/providers/providers.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController _valor = new TextEditingController();

    List mayoresQue = context.watch<GlobalState>().mayorQue;
    List menoresQue = context.watch<GlobalState>().menorQue;
    List historial = context.watch<GlobalState>().historial;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adivina el número'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const SizedBox(width: 44.0),
                Expanded(
                  flex: 4,
                  child: Form(
                    child: TextFormField(
                      controller: _valor,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Su número...',
                      ),
                      onFieldSubmitted: (String value) {
                        context.read<GlobalState>().intento(int.parse(value));
                        _valor.clear();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Intentos:'),
                      Text('${context.watch<GlobalState>().intentos}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              color: Colors.grey[300],
              height: 175.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Mayor Que',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: mayoresQue.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  '${mayoresQue[index]}',
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Menor Que',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: menoresQue.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  '${menoresQue[index]}',
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Historial',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: historial.length,
                            itemBuilder: (context, index) {
                              return Text(
                                '${historial[index]['value']}',
                                style: TextStyle(
                                    color: (historial[index]['win']) ? Colors.green : Colors.red
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0,),

            Slider(
                value: double.parse(context.watch<GlobalState>().dificultad.toString()),
                divisions: 3,
                max: 3,
                label: context.watch<GlobalState>().dificultad.toString(),
                onChanged: (double value) {
                  switch (value) {
                    case 0:
                      context.read<GlobalState>().esFacil();
                      break;
                    case 1:
                      context.read<GlobalState>().esMedio();
                      break;
                    case 2:
                      context.read<GlobalState>().esDificil();
                      break;
                    case 3:
                      context.read<GlobalState>().esExtremo();
                      break;
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
