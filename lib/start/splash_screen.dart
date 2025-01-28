import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_db_01/core/color/colors.dart';
import 'package:student_db_01/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _colorAnimation;

    @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _colorAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.repeat(reverse:  true);

    Future.delayed(const Duration(seconds: 3),(){
     // ignore: use_build_context_synchronously
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen() ,));
    });
  }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _colorAnimation, 
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [blue, white, black],
                      begin:  Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        _colorAnimation.value,
                        (_colorAnimation.value + 0.0).clamp(0.0, 2.0),
                        (_colorAnimation.value + 0.2).clamp(0.0, 1.0),
                      ]
                      ).createShader(bounds);
                  },
                    child: Text(
                    'STUDENT\nMANAGEMENT',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  );
              },),
              const SizedBox(height: 40,),
              const Text('Student Management Database'),
              const Text('Loading...'),
          ],
        )
      ),
    );
  }
}