import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../presentation.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage, SettingBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: () => bloc.add(const LogoutButtonPressed()),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
          // ),
          child: Text('Logout', style: AppTextStyles.s14w400Primary()),
        ),
      ),
    );
  }
}
