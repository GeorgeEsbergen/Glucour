import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/util/constant.dart';
import '../../../../core/widgets/rowas.dart';
import '../../buttom_nav_bar.dart';

class SubscriptionHome extends StatefulWidget {
  const SubscriptionHome({super.key});

  @override
  State<SubscriptionHome> createState() => _SubscriptionHomeState();
}

class _SubscriptionHomeState extends State<SubscriptionHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(right: 20, left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MaianAppBar(
              text: 'Subscription',
            ),
            const SizedBox(height: 40),
            PaymentCard(
              number: 100,
              description:
                  "Pay Subscription of the Month to continue usnig the app ",
              grade: 'Silver',
              fn: () {},
              m: 'month',
            ),
            const SizedBox(height: 20),
            PaymentCard(
              number: 200,
              description:
                  "Pay Subscription of 3 Month to continue usnig the app ",
              grade: 'Gold',
              fn: () {},
              m: '3 month',
            ),
            const SizedBox(height: 20),
            PaymentCard(
              number: 500,
              description:
                  "Pay Subscription of Year to continue usnig the app ",
              grade: 'Platnium',
              fn: () {},
              m: 'year',
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}

class PaymentCard extends StatefulWidget {
  const PaymentCard({
    super.key,
    required this.number,
    required this.description,
    required this.grade,
    required this.m,
    required this.fn,
  });
  final int number;
  final String description;
  final String grade;
  final String m;
  final VoidCallback fn;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Card.outlined(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.grade,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.dollarSign,
                    size: 18,
                  ),
                  Text("${widget.number}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600)),
                  Text("/ ${widget.m}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: Text(widget.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
              ),
              const SizedBox(height: 70),
              AnimatedButton(
                          text: 'Success Dialog',
                          width: 200,
                          height: 100,
                          color: MainAssets.blue,
                          pressEvent: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              headerAnimationLoop: false,
                              dialogType: DialogType.success,
                              btnOkColor: MainAssets.blue,
                              showCloseIcon: true,
                              title: 'Succesful Operation ',
                              desc:
                                  'Your Subscription has been successfully renewed',
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                                Navigator.of(context)
                                    .pushNamed(BottomNavBarScreen.routeName);
                              },
                              btnOkIcon: Icons.check_circle,
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          },
                        ), const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
