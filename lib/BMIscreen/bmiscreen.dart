import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
class bmiscreen extends StatefulWidget {
  const bmiscreen({super.key});

  @override
  State<bmiscreen> createState() => _bmiscreenState();
}

class _bmiscreenState extends State<bmiscreen> {

  void calculateBMI(){
    bmi = weight/pow(height/100, 2);
  setState(() {
    bmi = double.parse(bmi.toStringAsFixed(2));
    message = getBMIMessage(bmi);
  });

  }

   getBMIMessage(double bmi){
    if(selectgender== 0){
    // boys under 18
      if(weight<14 && age<2){
        return bmi < 14 ? "Underweight" : "Normal weight";
      }else if (age>=2 && age<5){
        return bmi < 15 ? "Underweight" : "Normal weight";
      }else if (age>=5 && age<10){
        return bmi < 16 ? "Underweight" : "Normal weight";
      }else if (age>=10 && age<14){
        return bmi < 17 ? "Underweight" : "Normal weight";
      }else if (age>=14 && age<18){
        if(bmi < 17) return "Underweight";
        if(bmi >=17 && bmi < 20.9) return "Normal weight";
        if(bmi >=21 && bmi < 25) return "Over weight";
        if(bmi > 25) return " obese";
      }else { // 18+ years (Adults)
        if (bmi < 18.5) return "Underweight";
        if (bmi >= 18.5 && bmi <= 24.9) return "Normal Weight";
        if (bmi >= 25 && bmi <= 29.9) return "Overweight";
        return "Obese";
      }
    } else { // Female
      // Approximate lookup table for girls
      if (age < 2) {
        return bmi < 13 ? "Underweight" : "Normal Weight";
      } else if (age >= 2 && age < 5) {
        return bmi < 14 ? "Underweight" : "Normal Weight";
      } else if (age >= 5 && age < 10) {
        return bmi < 15 ? "Underweight" : "Normal Weight";
      } else if (age >= 10 && age < 14) {
        return bmi < 16 ? "Underweight" : "Normal Weight";
      } else if (age >= 14 && age < 18) { // 14-17 years
        if (bmi < 16) return "Underweight";
        if (bmi >= 16 && bmi <= 19) return "Normal Weight";
        if (bmi >= 19.1 && bmi <= 22) return "Overweight";
        return "Obese";
      } else { // 18+ years (Adults)
        if (bmi < 18.5) return "Underweight";
        if (bmi >= 18.5 && bmi <= 24.9) return "Normal Weight";
        if (bmi >= 25 && bmi <= 29.9) return "Overweight";
        return "Obese";
      }
    }
  }

 int weight = 10;
 String message = "Please Input Your Detail";
 double bmi = 0;
 int selectgender = 0 ;
 int height = 20;
 int age = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FitCHECK"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 20),
              // margin: EdgeInsets.only(left: 20,right: 20),
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.deepOrange,
                      ),
                      child: Column(
                        children: [
                          IconButton(onPressed:(){
                          setState(() {
                            selectgender = 0;
                          });
                          },
                          icon: Icon(Icons.male,
                          size: 60,
                            color: selectgender == 0 ? Colors.white : Colors.black,
                          )),
                          Text("Male",style: TextStyle(
                            color: selectgender == 0 ? Colors.white : Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.deepOrange,
                      ),

                      child: Column(
                        children: [
                          IconButton(onPressed:(){
                            setState(() {
                              selectgender = 1;
                            });
                          },
                              icon: Icon(Icons.female,
                              size: 60,
                                color: selectgender == 1 ? Colors.white : Colors.black,
                              )),
                          Text("Female",style: TextStyle(
                            color: selectgender == 1 ? Colors.white : Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange,
              ),
              margin: EdgeInsets.only(left: 30,right: 30,top: 30),
              child:Column(
                children: [
                  Text("height",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Slider(
                      value: height.toDouble(),
                      max: 251,
                      min: 0,
                      divisions: 251,
                      onChanged: (value){
                        setState(() {
                          height = value.toInt();
                        });
                      }
                  ),
                  Text("$height",

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin:EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepOrange,
                      ),
                       padding: EdgeInsets.only(top: 20,bottom: 20),
                       child: Column(
                         children: [
                            ItemCount(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                buttonSizeHeight: 35,
                                buttonSizeWidth: 35,
                                initialValue: weight
                                , minValue: 1,
                                maxValue: 350,
                                onChanged:(value){
                                 setState(() {
                                   weight = value.toInt();
                                 });
                                },
                                decimalPlaces: 0),
                           Text("Weight",

                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 17,
                               fontWeight: FontWeight.bold,
                             ),
                           )
                         ],
                       ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepOrange,
                      ),
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      child: Column(
                        children: [
                          ItemCount(
                              buttonSizeHeight: 35,
                              buttonSizeWidth: 35,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              initialValue: age
                              , minValue: 1,
                              maxValue: 150,
                              onChanged:(value){
                                setState(() {
                                  age = value.toInt();
                                });
                              },
                              decimalPlaces: 0),
                          Text("Age",

                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.only(left: 30,right: 30,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepOrange,
              ),
              padding: EdgeInsets.only(top: 10,bottom: 10),
           child: MaterialButton(
             onPressed:(){
             calculateBMI();
           },
           child: Text("Calculate",
           style: TextStyle(
             color: Colors.black,
             fontSize: 17,
             fontWeight: FontWeight.bold,
           ),
           ),
           ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin:EdgeInsets.only(left: 30,right: 30,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepOrange,
              ),
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child:Column(
                children: [
                  Text("BMI:${bmi}", style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("Review: ${message}", style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "Times New Roman",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
