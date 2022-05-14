import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/tic.png',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SwitchListTile(
            title: const Text("Sound"),
            value: false,
            onChanged: (value) {},
          ), SwitchListTile(
            title: const Text("vibration"),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("player 1"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("player 2"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}
