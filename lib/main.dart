import 'package:flutter/material.dart';
import 'package:testing_app/newPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color redBackground = Colors.red;
  Color whiteBackground = Colors.white;
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRed ? redBackground : whiteBackground,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'This is the title',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: const [
          Icon(
            Icons.wifi,
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRed = !isRed;
                });
              },
              child: const Text("Click me if you dare"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewPage(
                        isRed: isRed,
                      );
                    },
                  ),
                );
              },
              child: const Text("Go to the Next Page"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ads_click_outlined),
            ),
            Center(
              child: Image.network(
                'https://cdn.britannica.com/09/75509-050-86D8CBBF/Albert-Einstein.jpg',
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
