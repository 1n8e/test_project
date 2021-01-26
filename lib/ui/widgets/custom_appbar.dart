import 'package:flutter/material.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/consts/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String screenTitle;
  final bool isHided;
  final double barHeight = 56;
  const CustomAppBar({Key key, this.screenTitle, this.isHided = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        decoration: BoxDecoration(
            gradient: CustomLinearGradient.customLinearGradient,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        child: Stack(
          children: [
            Offstage(
              offstage: isHided,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    screenTitle,
                    style: ConstTextStyles.screenTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
