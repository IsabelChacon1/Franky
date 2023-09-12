// ignore_for_file: constant_identifier_names
import "package:flutter/material.dart";
import "package:franky/pages/counter_screen.dart";

class MuchosComponentes extends StatelessWidget {
  const MuchosComponentes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          title: Text('',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
        ),
        ListTile(
          title: const Text('Single-Child',
              style: TextStyle(
                  //Para darle un formato al texto
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
          onTap: () {
            //cuando oprimes el boton
            Navigator.push(
              //Abre una pagina Nueva
              context,
              MaterialPageRoute(
                  //ruta horizontal(es la q abre rutas en flutter)
                  //constructor, funcion anonima que toma el context(estado actual) clase
                  builder: (context) =>
                      const SingleChildScrollViewExampleWidget()),
            );
          },
        ),
        ListTile(
          title: const Text('Radio',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RadioExample(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Escoge la Fecha',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 144, 77, 189))),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DatePickerApp(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FormExampleApp extends StatelessWidget {
  const FormExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form')),
        body: const FormExample(),
      ),
    );
  }
}

class CardExampleWidget extends StatelessWidget {
  const CardExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CardExample(),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingleChildScrollViewExampleWidget extends StatelessWidget {
  const SingleChildScrollViewExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single-Child/Card/Form'),
      ),
      body: const Center(
        child: SingleChildScrollViewExample(),
      ),
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    // A fixed-height child.
                    color: const Color.fromARGB(255, 137, 98, 146),
                    height: 200.0,
                    alignment: Alignment.center,
                    child: const CardExampleWidget(),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: const Color.fromARGB(255, 112, 102, 161),
                    height: 200.0,
                    alignment: Alignment.center,
                    child: const FormExampleApp(),
                  ),

                  // Container(
                  //   // Another fixed-height child.
                  //   color: Color.fromARGB(255, 128, 123, 155),
                  //   height: 200.0,
                  //   alignment: Alignment.center,
                  //   // child: const FormExampleApp(),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum SingingCharacter { este, o_este, o_mejor_este }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.este;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Los radio-button'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Este'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.este,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('o este'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.o_este,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('o mejor este'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.o_mejor_este,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nombre: ',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Aceptar'),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      restorationScopeId: 'app',
      home: const DatePickerExample(restorationId: 'main'),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fecha',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 100, 59, 128))),
        actions: const <Widget>[AppBarCustom()],
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Selecciona una fecha'),
        ),
      ),
    );
  }
}
