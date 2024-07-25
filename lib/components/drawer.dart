import 'package:audio_pulse/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Audio Pulse",
                    style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Icon(
                    Icons.audiotrack,
                    size: 36,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "HOME",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          ListTile(
            title: CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
            leading: Icon(
              Icons.dark_mode,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
    );
  }
}
