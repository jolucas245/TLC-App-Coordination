import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../viewmodels/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashViewModel>(context, listen: false).initController(this, context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/image/tlc_logo.png'),
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: DotLottieLoader.fromAsset(
                'assets/lottie/loading.lottie',
                frameBuilder: (context, dotLottie) {
                  if (dotLottie != null) {
                    return SizedBox(
                      width: 150,
                      child: Lottie.memory(
                        dotLottie.animations.values.single,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: AppColors.ORANGE,
                      strokeWidth: 6,
                      strokeCap: StrokeCap.round,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
