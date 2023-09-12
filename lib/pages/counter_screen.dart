import "package:flutter/material.dart";
import "package:franky/pages/mas_componentes.dart";
import "package:franky/pages/navigation.dart";

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('---FRANKY---')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 99, 119, 131),
              ),
              child: Text(
                'Este es un Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.face_4),
              title: Text('Hola'),
            ),
            ListTile(
              leading: Icon(Icons.face_2),
              title: Text('que tal?'),
            ),
            ListTile(
              leading: Icon(Icons.face_3),
              title: Text('arono'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Picale',
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 124, 69, 160))),
            Text('al botón',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 224, 147, 238))),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Botón para llevarte a un formulario
          CustomButton(
            icono: Icons.cake_rounded,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Feliz compleaños?'),
                content: const Text(
                    'FELIZ CUMPLEAÑOS!! y si no es tu cumpleaños, FELIZ NO CUMPLEAÑOS!!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} //fin clase _CounterScreenState

//Esta clase es para ahorrar código
class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
} //clase-constructor CustomButton

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.navigate_before_outlined),
      tooltip: 'Regresa',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                      'Regresa, no volver a escoger la fecha pofavo'),
                ),
                body: const NavigationBarApp(),
              );
            },
          ),
        );
      },
    );
  }
}
