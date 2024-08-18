import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_menu_app/constant/constant.dart';
import 'package:flutter_menu_app/widgets/menuList.dart';
import 'package:flutter_menu_app/widgets/topiciList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController(text: "Restaurant");
  String selectedtopic = "pizza";

  void updataSelectedtopic(String topic) {
    setState(() {
      selectedtopic = topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: ScreenSize.const_width,
            height: ScreenSize.const_height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/bg.jpg"),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: ScreenSize.const_width,
                    height: ScreenSize.const_height / 1.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenSize.const_height / 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name.text,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Enter Restaurant Name."),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: name,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please, enter a value";
                                              }
                                              return null;
                                            },
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        MenuTopic(
                          onSelected: updataSelectedtopic,
                          selectedtopic: selectedtopic,
                        ),
                        Menulist(selectedtopic: selectedtopic),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenSize.const_height / 4.5,
                  child: CircleAvatar(
                    radius: ScreenSize.const_width / 8,
                    backgroundImage: const AssetImage('assets/logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
