import 'package:flutter/material.dart';

class AllMenuScreen extends StatelessWidget {
  const AllMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('전체메뉴'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '로그인이 필요합니다',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0), // 내부 패딩
                      decoration: BoxDecoration(
                        color: Colors.blue, // 배경색
                        borderRadius: BorderRadius.circular(16.0), // 둥근 테두리
                      ),
                      child: Text(
                        '전기차 운행으로 지구를 지켜주세요:)',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/image_default_profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
