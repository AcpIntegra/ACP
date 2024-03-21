import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';

class RegularAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RegularAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Semantics(
          label: "ACP",
          child: ExcludeSemantics(
            child: Image(
              image: AssetImage(CustomThemes().gettheme().acpLogo2.toString()),
              height: 16,
              width: 52,
            ),
          ),
        ),
      ),
      title: FocusScope(
        child: Semantics(
          label: CustomThemes().projectname == 'annals'
              ? "Annals of Internal Medicine"
              : CustomThemes().projectname == 'aimcc'
                  ? "Annals of Internal Medicine Clinical Cases"
                  : "Clinical Guidelines",
          excludeSemantics: true,
          child: Image(
            image: AssetImage(CustomThemes().gettheme().headerlogo.toString()),
            height: CustomThemes().projectname == 'aimcc' ? 38 : 18,
            width: CustomThemes().projectname == 'aimcc' ? 145 : 221.76004,
          ),
        ),
      ),
      backgroundColor: CustomThemes().gettheme().bgColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
