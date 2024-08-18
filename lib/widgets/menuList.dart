import 'package:flutter/material.dart';
import 'package:flutter_menu_app/constant/constant.dart';
import 'package:flutter_menu_app/models/menuModel.dart';

class Menulist extends StatefulWidget {
  const Menulist({super.key, required this.selectedtopic});
  final String selectedtopic;

  @override
  State<Menulist> createState() => _MenulistState();
}

class _MenulistState extends State<Menulist> {
  Map<String, List<MenuModel>> menuMap = {
    "pizza": pizzaList,
    "shawerma": shawermaList,
    "burger": burgerList,
    "soup": soupList,
    "pasta": pastaList,
    "grilled": grilledList
  };

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    List<MenuModel> menuList = menuMap[widget.selectedtopic] ?? [];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: menuList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              width: ScreenSize.const_width / 2,
              height: ScreenSize.const_height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(menuList[index].img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(150, 0, 0, 0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menuList[index].name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      menuList[index].weight,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      width: 40,
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orangeAccent,
                      ),
                      child: Text(
                        menuList[index].price,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
