import 'package:flutter/material.dart';

class PersistentBottomSheet extends StatelessWidget {
  const PersistentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // 왼쪽 위 둥글게
            topRight: Radius.circular(20), // 오른쪽 위 둥글게
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '한국전기차충전서비스',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('운영시간'),
                  SizedBox(width: 6),
                  Text(
                    '24시간',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                '서울특별시 삼성동 100-3',
                style: TextStyle(
                  fontSize: 18,
                    color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
