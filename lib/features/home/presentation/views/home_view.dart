import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../../core/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if(connected){
              return const HomeViewBody();
            }
            else{
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    height: 18.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: connected
                          ? ColorStyles.kPrimaryColor
                          : const Color(0xFFEE4400),
                      child: Center(
                        child: connected
                            ? const Text("")
                            : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Offline",
                            ),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 1,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                child: Lottie.asset(
                "assets/lottie_json_animations/12434-no-connection.json",
                ),
                ),
                const Text("No Internet Connection , Try Again !",style: TextStyle(color: Colors.white,fontSize: 20),),
              ],
            ),

                ],
              );
            }

          },
          child: const Text("")
        ),
        //HomeViewBody(),
      ),
    );
  }
}
