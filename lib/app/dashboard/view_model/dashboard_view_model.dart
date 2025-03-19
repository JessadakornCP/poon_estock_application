import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_viewmodel.dart';
import '../../../core/model/local/menu_model.dart';
import '../../../core/model/response/user_Profile/user_profile_model.dart';
import '../../../core/provider/user_profile_provider.dart';

class DashboardViewModel extends BaseViewModel {
  final UserProfileProvider _userProfileProvider;
  DashboardViewModel({required BuildContext context})
    : _userProfileProvider = context.read<UserProfileProvider>();

  UserProfile? get userProfile => _userProfileProvider.userProfile;

  final List<MenuModel> _menuList = [];
  List<MenuModel> get menuList => _menuList;
}
