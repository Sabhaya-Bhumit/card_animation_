import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late AnimationController cardPassController;
late AnimationController cardPassController2;
late Animation card1Controller;
late Animation card2Controller;
late Animation card3Controller;
late Animation card4Controller;
late Animation card1Controller2;
late Animation card2Controller2;
late Animation card3Controller2;
late Animation card4Controller2;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    cardPassController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..forward();

    cardPassController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    card1Controller = Tween<double>(begin: 100, end: 296).animate(
        CurvedAnimation(parent: cardPassController, curve: Interval(0, 0.25)));

    card2Controller = Tween<double>(begin: 250, end: 0).animate(CurvedAnimation(
        parent: cardPassController, curve: Interval(0.25, 0.5)));

    card3Controller = Tween<double>(begin: 100, end: 300).animate(
        CurvedAnimation(
            parent: cardPassController, curve: Interval(0.5, 0.75)));

    card4Controller = Tween<double>(begin: 230, end: 0).animate(
        CurvedAnimation(parent: cardPassController, curve: Interval(0.75, 1)));

    card1Controller2 = Tween<double>(begin: 157, end: 40).animate(
        CurvedAnimation(parent: cardPassController2, curve: Interval(0.75, 1)));

    card2Controller2 = Tween<double>(begin: 300, end: 490).animate(
        CurvedAnimation(
            parent: cardPassController2, curve: Interval(0.5, 0.75)));

    card3Controller2 = Tween<double>(begin: 0, end: 230).animate(
        CurvedAnimation(
            parent: cardPassController2, curve: Interval(0.25, 0.5)));

    card4Controller2 = Tween<double>(begin: 297, end: 490).animate(
        CurvedAnimation(parent: cardPassController2, curve: Interval(0, 0.25)));

    cardPassController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Stack(alignment: const Alignment(0, -0.7), children: [
        Image.asset(
          "asstes/pool-table-dark_251819-845-removebg-preview.png",
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Stack(
          children: [
            AnimatedBuilder(
              animation: cardPassController,
              builder: (context, child) {
                return Positioned(
                    top: card1Controller.value,
                    left: card1Controller2.value,
                    // right: 500,
                    // right: 0,
                    // bottom: -10,
                    child: Image.asset(
                      "asstes/download-removebg-preview.png",
                      height: 100,
                    ));
              },
            ),
            AnimatedBuilder(
              animation: cardPassController,
              builder: (context, child) {
                return Positioned(
                    right: 0,
                    bottom: card2Controller2.value,
                    left: card2Controller.value,
                    child: Image.asset(
                      "asstes/download-removebg-preview.png",
                      height: 100,
                    ));
              },
            ),
            AnimatedBuilder(
              animation: cardPassController,
              builder: (context, child) {
                return Positioned(
                    bottom: card3Controller.value,
                    right: 0,
                    left: card3Controller2.value,
                    child: Image.asset(
                      "asstes/download-removebg-preview.png",
                      height: 100,
                    ));
              },
            ),
            AnimatedBuilder(
              animation: cardPassController,
              builder: (context, child) {
                if (cardPassController.isCompleted) {
                  cardPassController.reverse();
                  cardPassController2.forward();
                }
                return Positioned(
                    top: card4Controller2.value, //297
                    right: card4Controller.value,
                    left: 0,
                    child: Image.asset(
                      "asstes/download-removebg-preview.png",
                      height: 100,
                    ));
              },
            ),
          ],
        )
      ]),
    );
  }
}
