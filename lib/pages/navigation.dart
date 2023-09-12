import "package:flutter/material.dart";
import "package:franky/pages/counter_screen.dart";
import "package:franky/pages/mas_componentes.dart";

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 151, 134, 247),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.alarm),
            icon: Icon(Icons.alarm_add_outlined),
            label: 'Alerta',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.gif_box),
            icon: Icon(Icons.gif_box_outlined),
            label: 'Box',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: 'Lista',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: const Color.fromARGB(255, 254, 255, 183),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hola',
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(251, 250, 187, 239))),
              Text('Bienvenido',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(255, 175, 98, 189))),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 255, 120, 165),
          alignment: Alignment.center,
          child: const CounterScreen(),
        ),
        Container(
            color: const Color.fromARGB(255, 224, 176, 243),
            alignment: Alignment.center,
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxE(),
                  Text('Checkbox',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 144, 77, 189))),
                ])),
        Container(
          color: const Color.fromARGB(255, 253, 218, 230),
          alignment: Alignment.center,
          child: const MuchosComponentes(),
        ),
      ][currentPageIndex],
    );
  }
}

/////
class CheckboxE extends StatefulWidget {
  const CheckboxE({super.key});

  @override
  State<CheckboxE> createState() => _CheckboxEState();
}

class _CheckboxEState extends State<CheckboxE> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 0, 92, 12);
      }
      return const Color.fromARGB(255, 57, 54, 244);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
