import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String infoText;
  final String infoTextLink;
  final String route;
  Labels(
      {@required this.route,
      @required this.infoText,
      @required this.infoTextLink});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            infoText,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, route);
            },
            child: Text(
              infoTextLink,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
