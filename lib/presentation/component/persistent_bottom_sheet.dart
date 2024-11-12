import 'package:flutter/material.dart';

class PersistentBottomSheet extends StatefulWidget {
  final String address;

  const PersistentBottomSheet({
    super.key,
    required this.address,
  });

  @override
  State<PersistentBottomSheet> createState() => _PersistentBottomSheetState();
}

class _PersistentBottomSheetState extends State<PersistentBottomSheet> {
  late String currentAddress;

  @override
  void initState() {
    super.initState();
    currentAddress = widget.address;
  }

  void updateAddress(String newAddress) {
    setState(() {
      currentAddress = newAddress;
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
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
              const Row(
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
                currentAddress,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
