import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

import '../../view_helper.dart';
import 'arrow_loading_item.dart';

class ArrowLoading extends StatelessWidget {
  final int count;
  final bool isListView;

  ArrowLoading({this.count, this.isListView = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: !isListView,
        itemCount: count+1,
        itemBuilder: (context, index) {
          if (0 == index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 34,
                        color: Colors.white.withOpacity(0.05),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 34,
                              color: Colors.white.withOpacity(0.05),
                              child: Align(
                                child: AiSvgPicture.asset(
                                  'assets/images/detail/icon_detail_arrow_all.svg',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  sw(10),
                                  Expanded(child: SizedBox(
                                      height: 16,
                                      child: strip())),
                                  sw(10),
                                  Expanded(child: SizedBox(
                                      height:16,
                                      child: strip())),
                                  sw(10),
                                  Expanded(child: SizedBox(
                                      height: 16,
                                      child: strip())),
                                  sw(47),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 34,
                    height: 34,
                    margin: EdgeInsets.only( left: 10),
                    decoration: BoxDecoration(
//                    color: Color(0xFF394E5C),
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: AiSvgPicture.asset(
                        'assets/images/liveplayer/icon_pushpin.svg',
                        width: 20,
                        height: 20),
                  )
                ],
              ),
            );
          }
          return ArrowLoadingItem();
        });
  }

  Widget strip() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
