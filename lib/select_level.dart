import 'package:flutter/material.dart';
import 'package:words/Levels/level1.dart';
import 'package:words/Levels/level2.dart';

class SelectLevels extends StatelessWidget {
  const SelectLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "4 Pics 1 Word",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Level1();
              }));
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
              child: const Center(
                child: Text(
                  "Level 1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Level2();
              }));
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
              child: const Center(
                child: Text(
                  "Level 2",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
