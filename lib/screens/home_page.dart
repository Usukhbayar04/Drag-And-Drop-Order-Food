import 'package:flutter/material.dart';
import 'package:order_food/screens/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Stack(
        children: [
          SizedBox(
            height: heigth,
            child: Image.network(
              'https://www.threecamellodge.com/wp-content/uploads/2020/10/dining-06.jpg',
              height: heigth,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Mongolian Food',
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 65, 62, 62),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Монголын үндэсний хоолны рестауран',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(255, 43, 41, 41),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(178, 100, 255, 219),
                        )),
                        child: const Text(
                          'Go to Menu',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
