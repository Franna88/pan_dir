import 'package:flutter/material.dart';

class MenuIndexWidget extends StatefulWidget {
  int menuIndex;
  
  MenuIndexWidget({super.key, required this.menuIndex});

  @override
  State<MenuIndexWidget> createState() => _MenuIndexWidgetState();
}

class _MenuIndexWidgetState extends State<MenuIndexWidget> {
  @override
  Widget build(BuildContext context) {

    
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "< ",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                "${widget.menuIndex}/5",
                style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  " >",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          );
  }
}