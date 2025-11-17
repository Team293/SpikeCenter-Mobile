import 'package:mobile/screens/mainpage.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(App(initialRoute: '/'));
}

class App extends StatelessWidget {
  final String initialRoute;
  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      title: 'SpikeCenter Mobile',
      initialRoute: initialRoute,
      /* onGenerateRoute: (settings) { // Custom page route + transitions
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (context) => const CounterPage());
        }
      },*/
      theme: ThemeData(
        colorScheme: LegacyColorSchemes.darkZinc(),
        radius: 0.7,
      ),
      routes: {
        '/': (context) => MainPage()
      },
    );
  }
}