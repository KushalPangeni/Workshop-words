import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isImageBigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: SizedBox(
        height: 350,
        child: isImageBigger
            ? biggerImageContainer(
                "https://images.pexels.com/photos/85773/pexels-photo-85773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageContainer(
                          'https://images.pexels.com/photos/85773/pexels-photo-85773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      const SizedBox(width: 10.0),
                      imageContainer(
                          'https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageContainer(
                          'https://images.pexels.com/photos/87452/flowers-background-butterflies-beautiful-87452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      const SizedBox(width: 10.0),
                      imageContainer(
                          'https://images.pexels.com/photos/68507/spring-flowers-flowers-collage-floral-68507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget imageContainer(String imageUrl) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isImageBigger == false) {
            isImageBigger = true;
          }
        });
      },
      child: Container(
        height: 170,
        width: 150,
        decoration: BoxDecoration(color: Colors.amber, border: Border.all(width: 5, color: Colors.teal)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget biggerImageContainer(String imageUrl) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            if (isImageBigger == true) {
              isImageBigger = false;
            }
          });
        },
        child: Container(
          height: 350,
          width: 310,
          decoration: BoxDecoration(color: Colors.amber, border: Border.all(width: 5, color: Colors.teal)),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
