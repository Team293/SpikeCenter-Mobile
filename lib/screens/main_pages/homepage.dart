import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:mobile/widgets/mainpage_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int _selected = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
              ).p(),
              Text(
                '$_counter',
              ).h1(),
              PrimaryButton(
                onPressed: _incrementCounter,
                density: ButtonDensity.icon,
                child: const Icon(Icons.add),
              ).p(),
            ],
          ),
        ),
    );
  }
}