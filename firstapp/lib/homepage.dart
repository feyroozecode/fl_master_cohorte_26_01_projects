import 'package:flutter/material.dart';

/// Cette page contient le widget MyHomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  TextEditingController counterController = TextEditingController();

  List<int> numbers = [10, 20, 30, 40, 50, 60, 70, 80];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = 10;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    counterController.dispose();
    super.dispose();
  }

  void _decremtCounter() {
    setState(() {
      _counter >= 1 ? _counter = _counter - 10 : _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Information'),
                    content: const Text(
                      'Ceci est une application de compteur simple.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Fermer'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            // listview
            ListView.builder(
              itemCount: numbers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Nombre: ${numbers[index]}'),
                  onTap: (){
                    setState(() {
                      _counter = numbers[index];
                      counterController.text = numbers[index].toString();
                    });
                  } ,
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: counterController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Entrez un nombre',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _counter = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),

            const Text('Vous avez cliquer sur le bouton :'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text("Fois"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // DECREMENT BUTTON
          FloatingActionButton(
            onPressed: _decremtCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          SizedBox(width: 16), // Espacement entre les boutons

          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
