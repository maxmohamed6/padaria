import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/padaria.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 50,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 4,
              ),
            ),
            Padding(
              // spaced widget
              padding: const EdgeInsetsGeometry.all(40),
              child: Text(
                '$count', // or count.ToString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.red : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Saiu',
                    style: TextStyle(
                      color: isEmpty ? Colors.white : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),

                const SizedBox(
                  //space between buttons
                  width: 40,
                ),

                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.red : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Entrou',
                    style: TextStyle(
                      color: isFull ? Colors.white : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
