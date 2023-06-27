import 'package:flutter/material.dart';
import 'package:modern_smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartdevices = [
    ["Smart Light", "img/lightbulb.png", true],
    ["Smart AC", "img/air-conditioner.png", false],
    ["Smart TV", "img/smart-tv.png", false],
    ["Smart Fan", "img/fan.png", false],
  ];

  void powerSwitchChanged(bool value ,int index){
    setState(() {
  mySmartdevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "img/more.png",
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          ///
          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Home",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),),
                const Text(
                  "ESBI79",
                  style: TextStyle(
                    fontSize: 72,
                  ),
                ),
              ],
            ),
          ),

          ///
          ///
          const SizedBox(
            height: 50,
          ),

          ///
          ///
          ///
          ///
           Padding(padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child:  Text("Smart Devices",
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 24,
              color: Colors.grey[800],
            ),
            ),
          ),

          ///
          ///
          ///
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(25),
              itemCount: mySmartdevices.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 1/1.3
                  ),
              itemBuilder: (context, index) {
                return SmartdeviceBox(
                    smartDeviceName: mySmartdevices[index][0],
                    iconPath: mySmartdevices[index][1],
                    powerOn: mySmartdevices[index][2], onchanged: (value)=> powerSwitchChanged(value, index),);

              },
            ),
          ),
        ],
      )),
    );
  }
}
