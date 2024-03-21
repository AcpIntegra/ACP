import 'dart:io';

import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SecondaryAppBar({required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(73.84);

  @override
  Widget build(BuildContext context) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Consumer(builder: (context, ref, child) {
      final bool isDark = ref.watch(darkModeProvider);
      return Column(
        children: [
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(),
                  boxShadow: isDark
                      ? null
                      : [
                          BoxShadow(
                            color: CustomThemes().gettheme().greybackground,
                            spreadRadius: 0.5,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                ),
                child: FocusScope(
                  child: AppBar(
                    elevation: 5,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Row(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Center(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: CustomThemes().gettheme().font1,
                              color: isDark
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().bgColor,
                              fontWeight: FontWeight.w700,
                              fontSize: isIpad
                                  ? 24 + CustomThemes().gettheme().ipadfontsize
                                  : 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    surfaceTintColor: isDark
                        ? CustomThemes().gettheme().darkmodegrey
                        : CustomThemes().gettheme().whitecolor,
                    backgroundColor: isDark
                        ? CustomThemes().gettheme().darkmodegrey
                        : CustomThemes().gettheme().whitecolor,
                  ),
                ),
              )), // Thin line with light shadow
        ],
      );
    });
  }
}
