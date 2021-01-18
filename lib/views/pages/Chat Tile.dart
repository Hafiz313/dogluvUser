import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        children: [
          Container(
            width: AppSizes.blockSizeVertical * 6.5,
            height: AppSizes.blockSizeVertical * 6.5,
            decoration: BoxDecoration(
                color: kColorPrimary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                    image: AssetImage('assets/images/Robert.png'))),
          ),
          Positioned(
            bottom: 2,
            right: 0,
            child: Container(
              height: AppSizes.blockSizeVertical * 1.7,
              width: AppSizes.blockSizeVertical * 1.7,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5)),
            ),
          )
        ],
      ),
      title: Text(
        'George Zeu',
        style: simpleText(fontWeight: FontWeight.w700),
      ),
      subtitle: Container(
          width: AppSizes.blockSizeHorizontal * 70,
          child: Text(
            'Last message text shows here',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: simpleText(
                color: kGrayBarBg,
                fontSize: AppSizes.blockSizeHorizontal * 3.5),
          )),
    );
  }
}