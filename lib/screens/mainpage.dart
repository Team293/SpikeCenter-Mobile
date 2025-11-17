import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:mobile/widgets/navbar.dart';
import 'package:mobile/screens/main_pages/homepage.dart';
import 'package:mobile/screens/main_pages/settingspage.dart';

class MainPage extends StatefulWidget {
  final pages = [
    [
      'Discover',
      null,
      Icons.explore,
      Container()
    ],
    [
      'Data',
      null,
      Icons.analytics,
      Container()
    ],
    [
      'Home',
      null,
      Icons.home,
      HomePage(),
    ],
    [
      'Upcoming Matches',
      null,
      Icons.date_range,
      Container()
    ],
    [
      'Settings',
      null,
      Icons.settings,
      SettingsPage(),
    ]
  ];

  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selected = 2;

  NavigationItem _buildButton(String label, IconData icon, [String? route]) {
    return NavigationItem(
        label: Text(label).h1(),
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

  List<NavigationItem> _getNavItems() {
    return widget.pages.map((page) {
      String label = page[0] as String;
      IconData icon = page[2] as IconData;
      return _buildButton(label, icon);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    String title = widget.pages[_selected][0] as String;
    String? subtitle = widget.pages[_selected][1] as String?;
    Widget screen = widget.pages[_selected][3] as Widget;
    return Scaffold(
      headers: [
        AppBar(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          leading: [
            GhostButton(
              onPressed: () {
                openDrawer(
                  context: context,
                  builder: (context) {
                    return Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.8,
                      ),
                      child: ListView(
                        children: [

                        ]
                      )
                    );
                  },
                  position: OverlayPosition.left,
                );
              },
              density: ButtonDensity.icon,
              child: const Icon(Icons.menu),
            ),
          ],
          /*trailing: [
            GhostButton(
              density: ButtonDensity.icon,
              onPressed: () {
                openSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: const Text('Sheet'),
                    );
                  },
                  position: OverlayPosition.right,
                );
              },
              child: const Icon(Icons.search),
            ),
          ],*/
        ),
        const Divider(),
      ],
      footers: [
        const Divider(),
        NavigationBar(
          onSelected: (i) {
            setState(() {
              _selected = i;
            });
          },
          index: _selected,
          children: _getNavItems()
        )
      ],
      child: screen,
    );
  }
}