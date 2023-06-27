import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SmartdeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onchanged;
   SmartdeviceBox({super.key,required this.smartDeviceName,required this.iconPath,required this.powerOn,required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(color: powerOn ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(iconPath,
              height: 65,
                  color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding:  EdgeInsets.only(left: 25),
                    child: Text(smartDeviceName,style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                    color: powerOn ? Colors.white : Colors.black,
                    ),),
                  )),
                  Transform.rotate(
                    angle: pi/2,
                    child: CupertinoSwitch(value: powerOn, onChanged: onchanged),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
