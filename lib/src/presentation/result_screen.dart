import 'package:cardiovascular_predictor_ui/src/domain/entity/health_topic_entity.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  final CardioLoadedState state;
  const ResultScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  void _launchURL(String link) async {
    final Uri url = Uri.parse(link);
    try {
      await launchUrl(url);
    } catch (e) {
      Text(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        state.message == 'You need to take \ncare of your heart'
            ? Lottie.asset('assets/support.json',
                fit: BoxFit.contain, height: screenHeight)
            : Lottie.asset('assets/celebrate.json',
                fit: BoxFit.fill, height: screenHeight),
        Positioned(
          bottom: screenHeight / 5.5,
          left: screenHeight / 8,
          child: ElevatedButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                        itemBuilder: (context, index) {
                          var item = healthTipsList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(item.topic),
                              trailing: SvgPicture.asset(item.imageUrl),
                              onTap: () => _launchURL(item.url),
                              tileColor: Colors.green.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        },
                        itemCount: healthTipsList.length,
                      ));
                }),
            child: Row(
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Lottie.asset('assets/notify.json')),
                const Text(
                  'Get Health Tips',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight / 19,
          left: screenWidth / 2.2,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ))
            ],
          ),
        ),
        Positioned(
          top: state.message == 'You need to take \ncare of your heart'
              ? screenHeight / 12
              : screenHeight / 11,
          left: screenWidth / 6.3,
          child: Text(
            state.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    );
  }
}
