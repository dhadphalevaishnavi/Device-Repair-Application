import 'package:fixkaar/screens_and_widgets/screens/ShowModelScreen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String iconUrl;
  final String brandOrModelName;

  const CardWidget({
    super.key,
    required this.brandOrModelName,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[50],
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: Ink.image(image: NetworkImage(iconUrl)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(brandOrModelName),
        ],
      ),
    );
  }


}
