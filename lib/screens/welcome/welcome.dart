import 'package:adminease/screens/welcome/notifier/welcome_notifier.dart';
import 'package:adminease/screens/welcome/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  //int dotsIndicator=0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProviderProvider);

    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.only(top: 30.h),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              onPageChanged: (value) {
                ref.read(indexDotProviderProvider.notifier).changeIndex(value);
              },
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                appOnBoardPage(_controller,
                    title: "nfc",
                    subtitle: "primeira onboard screen",
                    index: 1, context: context),
                appOnBoardPage(_controller,
                    title: "nfc", subtitle: "segunda onboard screen", index: 2, context: context),
                appOnBoardPage(_controller,
                    title: "nfc",
                    subtitle: "terceira onboard screen",
                    index: 3, context: context),
              ],
            ),
            Positioned(
              bottom: 50,
              child: DotsIndicator(
                position: index,
                dotsCount: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                decorator: const DotsDecorator(size: Size.square(9.0)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
