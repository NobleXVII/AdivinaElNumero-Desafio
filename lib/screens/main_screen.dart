import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _valor = new TextEditingController();
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
                      Text('5'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),

            Container(
              color: Colors.grey,
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
                      ],
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Menor Que',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Historial',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 10.0
            ),

            Slider(
                value: 0,
                divisions: 3,
                max: 3,
                label: 'Numero',
                onChanged: (double value) {
                  print(value);
                }
            )
          ],
        ),
      ),
    );
  }
}
