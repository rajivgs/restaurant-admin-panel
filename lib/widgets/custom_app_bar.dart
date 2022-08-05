import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/setting_bloc/setting_bloc.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        if (state is SettingLoading) {
          return AppBar(
            title: Text("Your Restaurant Name",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white)),
            centerTitle: false,
          );
        }
        if (state is SettingLoaded) {
          return AppBar(
            title: Text(
              (state.restaurant.name == null)
                  ? 'Set a Name for Your Restaurant'
                  : state.restaurant.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
            centerTitle: false,
          );
        } else {
          return const Text("Something is wrong");
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
