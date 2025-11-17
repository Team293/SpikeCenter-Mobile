import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:mobile/widgets/mainpage_wrapper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Settings Page',
                textAlign: TextAlign.center,
              ).h1(),
            ],
          ),
        )
    );
  }
}