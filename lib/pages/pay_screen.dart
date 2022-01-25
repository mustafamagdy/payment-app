import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/app_button.dart';
import 'package:flutter_payment_app/component/app_icon_button.dart';
import 'package:flutter_payment_app/component/colors.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/paymentbackground.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 100,
            child: Image.asset('images/success.png'),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 200,
            child: Container(
              height: 380,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Success !',
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Payment is completed for 2 bills',
                    style: TextStyle(
                      color: AppColor.mainColor.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _totalTile(),
                        Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                        _totalTile(),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      color: AppColor.mainColor.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$1234.00',
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconButton(
                      label: 'Share',
                      onPressed: () {},
                      icon: Icons.share,
                      color: AppColor.mainColor,
                    ),
                    SizedBox(width: 60),
                    AppIconButton(
                      label: 'Print',
                      onPressed: () {},
                      icon: Icons.print,
                      color: AppColor.mainColor,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 250,
                  child: AppButton(
                      label: 'Ok',
                      bgColor: Colors.white,
                      color: AppColor.mainColor,
                      borerColor: AppColor.mainColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile _totalTile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.check),
      ),
      title: Text(
        'Some title here',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        'ID: 1234555',
        style: TextStyle(fontWeight: FontWeight.w200),
      ),
      trailing: Text(
        '\$1234.00',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
