import 'dart:developer';

import 'package:flutter/material.dart';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  bool isImageBigger = false;
  String biggerImageUrl = '';
  bool isGameOver = false;
  String img1 =
      'https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  String img2 =
      'https://images.pexels.com/photos/756861/pexels-photo-756861.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  String img3 =
      'https://images.pexels.com/photos/1173777/pexels-photo-1173777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  String img4 =
      'https://images.pexels.com/photos/229014/pexels-photo-229014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  List answerList = ['', '', '', ''];
  List options = ['L', 'O', 'F', 'D', 'K', 'R', 'A', 'T', 'E', 'H'];
  String answer = "ROAD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 350,
                child: isImageBigger
                    ? biggerImageContainer()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [imageContainer(img1), const SizedBox(width: 10.0), imageContainer(img2)],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [imageContainer(img3), const SizedBox(width: 10.0), imageContainer(img4)],
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(answer.length, (index) => cardForAnswers(index, answerList[index]))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => optionCard(index, options[index])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => optionCard(index + 5, options[index + 5])),
              ),
            ],
          ),
          if (isGameOver)
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You Won",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Next Level"))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget cardForAnswers(int index, String alphabet) {
    return InkWell(
      onTap: () {
        setState(() {
          for (int i = 0; i < options.length; i++) {
            if (options[i] == '') {
              options[i] = alphabet;
              answerList[index] = '';
              break;
            }
          }
        });
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(offset: Offset(0, 2), blurRadius: 10, color: Colors.grey)],
        ),
        child: Center(
          child: Text(
            alphabet,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget optionCard(int index, String alphabet) {
    return InkWell(
      onTap: () {
        String checkAnswer = '';
        setState(() {
          for (int i = 0; i < answerList.length; i++) {
            if (answerList[i] == '') {
              answerList[i] = alphabet;
              options[index] = '';

              break;
              // options[]
            }
          }
        });

        for (var element in answerList) {
          checkAnswer += element;
        }
        if (answer == checkAnswer) {
          log('You Won');
          isGameOver = true;
        }
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(offset: Offset(0, 2), blurRadius: 10, color: Colors.grey)],
        ),
        child: Center(
          child: Text(
            alphabet,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
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
            biggerImageUrl = imageUrl;
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

  Widget biggerImageContainer() {
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
            biggerImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
