import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/constants.dart';

class AllMenuScreen extends StatefulWidget {
  const AllMenuScreen({super.key});

  @override
  State<AllMenuScreen> createState() => _AllMenuScreenState();
}

class _AllMenuScreenState extends State<AllMenuScreen> {
  GoogleSignInAccount? _currentUser;

  Future<void> _navigateToLogin(BuildContext context) async {
    final result = await context.push(Constants.loginRoute);
    if (result != null && result is GoogleSignInAccount) {
      setState(() {
        _currentUser = result;
        print('리턴 result 로그인 : $_currentUser');
      });
    }
  }

  Future<void> _navigateToLogOut(BuildContext context) async {
    final result = await context.push(Constants.userInfoRoute);
    if (result == null) {
      setState(() {
        _currentUser = result as GoogleSignInAccount?;
        print('리턴 result 로그아웃 : $_currentUser');
      });
    }
  }

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
        child: IntrinsicHeight(
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_currentUser == null) {
                _navigateToLogin(context);
              } else {
                _navigateToLogOut(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildUserInfo(),
                _buildProfileImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      _currentUser?.displayName != null
                          ? '${_currentUser!.displayName}님'
                          : '로그인이 필요합니다',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Text(
                    '전기차 운행으로 지구를 지켜주세요:)',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: 60,
        height: 60,
        child: _currentUser?.photoUrl != null
            ? Image.network(
                _currentUser!.photoUrl!,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/image_default_profile.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
