import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          for (final test in [1, 2, 3, 4, 5, 6, 7, 8]) const MenuTile()
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32),
      child: Row(
        children: const [
          Icon(Icons.settings),
          SizedBox(width: 10),
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
