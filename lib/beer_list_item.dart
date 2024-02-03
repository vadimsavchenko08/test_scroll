import 'package:flutter/material.dart';

/// List item representing a single Beer with its image and name.
class BeerListItem extends StatelessWidget {
  const BeerListItem({
    required this.beer,
    Key? key,
  }) : super(key: key);

  final String beer;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 400,
        width: 300,
        child: ListTile(
          title: Text(beer),
        ),
      );
}
