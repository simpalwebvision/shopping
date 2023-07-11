import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/profile/bloc/updated_info_bloc.dart';
import 'package:shopping/shop_now/profile/bloc/updated_info_state.dart';
import 'package:shopping/shop_now/profile/components/profile_app_bar.dart';
import 'package:shopping/shop_now/profile/components/profile_edit_form.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 180;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: appBarHeight,
            systemOverlayStyle: const SystemUiOverlayStyle(),
            flexibleSpace: BlocBuilder<UpdatedInfoBloc, UpdatedInfoState>(
              builder: (context, state) {
                if (state is UpdatedInfoLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UpdatedInfoErrorState) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is UpdatedInfoInitialState) {
                  return const ProfileAppBar(
                    height: appBarHeight,
                    logo: '',
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: BlocBuilder<UpdatedInfoBloc, UpdatedInfoState>(
              builder: (context, state) {
                if (state is UpdatedInfoLoadingState) {
                  // Utils.closeDialog(context);
                  // Utils.showSnackBar(context, 'Profile UpdateLoading');
                  return const Center(child: CircularProgressIndicator());
                  // Utils.loadingDialog(context);
                } else if (state is UpdatedInfoErrorState) {
                  // Utils.closeDialog(context);
                  // Utils.errorSnackBar(context, state.message);
                  return Text(state.errorMessage);
                } else if (state is UpdatedInfoInitialState) {
                  return const SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: ProfileEditForm(),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
