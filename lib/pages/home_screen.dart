import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/app_button.dart';
import 'package:flutter_payment_app/pages/pay_screen.dart';

import '../component/app_icon_button.dart';
import '../component/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        child: Stack(
          children: [
            _headSection(size),
            _actionButton(size, context),
            _trxList(size),
            _payBillButton(size, context),
          ],
        ),
      ),
    );
  }

  _headSection(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: size.width,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 30),
          child: Text(
            'My Bills',
            style: TextStyle(
                color: AppColor.backGroundColor,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    offset: Offset(10, 30),
                    blurRadius: 7,
                    blurStyle: BlurStyle.outer,
                    // spreadRadius: 7,
                  )
                ]),
          ),
        ),
      ),
    );
  }

  _actionButton(Size size, BuildContext context) {
    final top = (size.height * 0.3) - 110;
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: size.width,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/curve.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 40,
            child: GestureDetector(
              onTap: () {
                _showDropMenu(context, size.height, top);
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lines.png'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      // spreadRadius: 0,
                    )
                  ],
                ),
                width: 60,
                height: 60,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showDropMenu(
      BuildContext context, double height, double top) {
    return showModalBottomSheet(
        isDismissible: false,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          final newHeight = height - top - 40;
          return Container(
            height: newHeight,
            margin: const EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: AppColor.halfOval.withOpacity(0.1),
                    height: newHeight,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 36,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 5),
                    height: 250,
                    width: 65,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        AppIconButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          icon: Icons.close,
                        ),
                        SizedBox(height: 5),
                        AppIconButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          icon: Icons.add,
                          label: 'Add',
                        ),
                        AppIconButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          icon: Icons.history,
                          label: 'History',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  _trxList(Size size) {
    return Positioned(
      top: (size.height * 0.3) + 10,
      right: 0,
      left: 0,
      child: Container(
        width: size.width,
        height: size.height - 200,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: 10,
          itemBuilder: (ctx, idx) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15, right: 15),
              child: _buitedItemContent(),
            );
          },
        ),
      ),
    );
  }

  _buitedItemContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
          )
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: 125,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/brand1.png'),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text.rich(
                          TextSpan(
                            text: 'Some name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '\nID: 1234',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Auto pay on 24th May 21',
                    style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.backGroundColor),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Select'),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ 1234.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Due in 2 days',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black26,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: AppColor.halfOval,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: 5,
                height: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _payBillButton(Size size, BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        width: size.width,
        height: 55,
        child: AppButton(
            label: 'Pay all bills',
            borerColor: AppColor.mainColor,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return PayScreen();
                  },
                ),
              );
            }),
      ),
    );
  }
}
