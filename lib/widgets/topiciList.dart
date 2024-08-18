import 'package:flutter/material.dart';
import 'package:flutter_menu_app/constant/constant.dart';

class MenuTopic extends StatefulWidget {
  const MenuTopic(
      {super.key, required this.selectedtopic, required this.onSelected});
  final String? selectedtopic;
  final ValueChanged<String> onSelected;

  @override
  State<MenuTopic> createState() => _MenuTopicState();
}

class _MenuTopicState extends State<MenuTopic> {
  List<String> topics = [
    "pizza",
    "burger",
    "pasta",
    "soup",
    "shawerma",
    "grilled",
  ];

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context); 

    return SizedBox(
      height: ScreenSize.const_height / 12, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: topics.length,
        itemBuilder: (context, index) {
          bool isSelected = topics[index] == widget.selectedtopic; 
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onSelected(topics[index]); 
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenSize.const_width / 3.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), 
                  color: isSelected ? Colors.grey : kprimaryColor, 
                ),
                child: Text(
                  topics[index], 
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
