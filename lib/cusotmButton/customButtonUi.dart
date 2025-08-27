import 'package:flutter/material.dart';

class Custombuttonui extends StatelessWidget {
  const Custombuttonui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Button Controller')),
      body: SizedBox(
        width: 300,
        child: Center(
          child: Wrap(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(side: BorderSide(width: 1,color: Colors.green),
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.grey
                      
                  ),
                  onPressed: () {}, child: Text('One')),
              ElevatedButton(onPressed: () {}, child: Text('One')),
              ElevatedButton(onPressed: () {}, child: Text('One')),
              ElevatedButton(onPressed: () {}, child: Text('One')),
              ElevatedButton(onPressed: () {}, child: Text('One')),
            ],
          ),
        ),
      ),
    );
  }
}
