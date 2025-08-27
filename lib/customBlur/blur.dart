import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  const Blur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // পিছনের ব্যাকগ্রাউন্ড
          Image.network(
            'https://img.freepik.com/free-photo/3d-render-grunge-style-interior-design_1048-13616.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // ব্লার করা কন্টেইনার
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 5),
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.white.withOpacity(0.3), // রঙের অর্ধস্বচ্ছতা
                  child: const Center(
                    child: Text(
                      'Blurred Container',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
