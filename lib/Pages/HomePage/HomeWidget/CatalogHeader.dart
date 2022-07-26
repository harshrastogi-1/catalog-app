import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Catalog App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 40, 82),
              fontSize: 30),
        ),
        Text(
          "Treading Products",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 40, 82),
              fontSize: 15),
        )
      ],
    );
  }
}
