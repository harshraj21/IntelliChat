import 'package:flutter/material.dart';

import '../providers/customization.dart';
import '../models/customize.dart';
import '../models/myself.dart';

class DrawerzHeader extends StatelessWidget {
  final MediaQueryData mq;
  final double width, height;
  final MyselfModel myself;
  final CustomizeModel theme;
  final CustomizationProvider handle;
  DrawerzHeader({
    required this.height,
    required this.mq,
    required this.myself,
    required this.theme,
    required this.width,
    required this.handle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 195,
      decoration: BoxDecoration(
        color: Colors.black, /*  theme */
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: mq.padding.top + 20,
          bottom: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: myself.picuri == 'null'
                        ? Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                            ),
                            child: Center(
                              child: Text(
                                myself.name.substring(0, 2),
                                /* split and then first */
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          )
                        : Image(
                            image: NetworkImage(myself.picuri),
                            fit: BoxFit.cover,
                            width: 68,
                            height: 68,
                          ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(100),
                        // ),
                        width: 45,
                        height: 45,
                        // color: Colors.amber,
                        child: Icon(
                          theme.darkmode
                              ? Icons.wb_sunny_rounded
                              : Icons.dark_mode_rounded,
                          size: 30,
                          color: theme.darkmode ? null : Colors.white,
                        ),
                      ),
                      onTap: () {
                        // print('theme changed');
                        handle.toggle();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        myself.name,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        myself.secondaryid,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.logout_rounded),
                      ),
                      onTap: () {
                        print('logout');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
