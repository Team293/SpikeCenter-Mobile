import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:mobile/widgets/navbar.dart';

class MainPageWrapper extends StatefulWidget {
  final Widget child;
  final String label;
  String? subtitle;


  MainPageWrapper({super.key, required this.child, required this.label, this.subtitle});

  @override
  State<MainPageWrapper> createState() => _MainPageWrapperState();
}

class _MainPageWrapperState extends State<MainPageWrapper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      headers: [
        AppBar(
          title: Text(widget.label),
          subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
          leading: [
            GhostButton(
              onPressed: () {
                openDrawer(
                  context: context,
                  builder: (context) {
                    return Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: const Text('Drawer'),
                    );
                  },
                  position: OverlayPosition.left,
                );
              },
              density: ButtonDensity.icon,
              child: const Icon(Icons.menu),
            ),
          ],
          trailing: [
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
          ],
        ),
        const Divider(),
      ],
      footers: [
        const Divider(),
        Navbar()
      ],
      child: widget.child,
    );
  }
}