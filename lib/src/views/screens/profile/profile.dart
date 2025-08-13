// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/upload_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColors.blackColor,
            ),
          ),
        ),
        title: const Text('Profile'),
        actions: [
          InkWell(
            onTap: () {
              context.push(AppScreens.editProfile.path);
            },
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 19,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: Text(
              'Edit',
              style: context.textTheme.bodyMedium!
                  .copyWith(fontSize: 15, color: AppColors.txtPrimary),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Consumer<AuthProvider>(builder: (context, authProvider, child) {
            if (authProvider.user != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dr ${authProvider.user!.fullName}",
                        style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 18, color: AppColors.txtPrimary),
                      ),
                      InkWell(
                        onTap: () {
                          imagebottomSheet(
                            context: context,
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/icons/picker.svg',
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Personal Info',
                    style: context.textTheme.bodyMedium!
                        .copyWith(fontSize: 16, color: AppColors.blackColor),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  profileInfoWidget(
                    title: 'Doctor`s ID',
                    info: authProvider.user!.id!,
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Username',
                    info: "-",
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Name',
                    info: authProvider.user!.fullName,
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Date of Birth',
                    info: "-",
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Mobile No',
                    info: '${authProvider.user!.mobileNumber}',
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'City',
                    info: '-',
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Qualification',
                    info: 'MBBS',
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Email',
                    info: authProvider.user!.email,
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Speciality',
                    info: authProvider.user!.title,
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  profileInfoWidget(
                    title: 'Registration No',
                    info: '-',
                    theme: context.textTheme,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clinque Info',
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.blackColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.add),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Add new',
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Medikalam Technologies',
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: AppColors.blackColor, fontSize: 13),
                  ),
                  const Text('Dr Zakir Hussain Marg Delhi Golf Club'),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Divider(),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
