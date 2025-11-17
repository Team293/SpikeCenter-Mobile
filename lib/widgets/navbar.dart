import 'dart:ui';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Navbar extends StatefulWidget {

  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    NavigationItem _buildButton(String label, IconData icon, [String? route]) {
      return NavigationItem(
          label: Text(label),
          child: route != null ? GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != route) {
                Navigator.pushNamed(context, route);
              }
            },
            child: Icon(icon),
          ) : Icon(icon)
      );
    }

    return NavigationBar(
      onSelected: (i) {
        setState(() {
          _selected = i;
        });
      },
      index: _selected,
      children: [
        _buildButton('Explore', Icons.explore),
        _buildButton('Data', Icons.analytics),
        _buildButton('Home', Icons.home, '/'),
        _buildButton('Upcoming Matches', Icons.date_range),
        _buildButton('Settings', Icons.settings, '/settings'),
      ],
    );
  }
}