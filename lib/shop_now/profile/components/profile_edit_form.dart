import 'package:flutter/material.dart';
import 'package:shopping/utils/common_function.dart';
import '../../../widgets/primary_button.dart';

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: context.read<ProfileEditCubit>().formKey,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(),
          const Text(
            'UserName',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.name,
            initialValue: 'UserName',
            validator: (String? v) {
              if (v == null || v.isEmpty) return "*Name Required";
              return null;
            },
            decoration: const InputDecoration(hintText: 'Name'),
          ),

          const SizedBox(height: 16),

          // TextFormField(
          //   keyboardType: TextInputType.streetAddress,
          //   initialValue: widget.userData.updateUserInfo.address,
          //   onChanged: profileEdBlc.changeAddress,
          //   validator: (String? v) {
          //     if (v == null || v.isEmpty) return "*Address Required";
          //     return null;
          //   },
          //   decoration: InputDecoration(hintText: 'Your Address'),
          // ),
          const SizedBox(height: 20),
          PrimaryButton(
            text: 'Update Profile',
            onPressed: () {
              // Utils.closeKeyBoard(context);
              if (!_formKey.currentState!.validate()) return;
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff333333).withOpacity(.18),
            blurRadius: 70,
          ),
        ],
      ),
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/camera_image.png',
                height: 170,
                width: 170,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: InkWell(
                onTap: () async {
                  final imageSourcePath =
                      await CommonFunctions.pickSingleImage();
                  // context
                  //     .read<ProfileEditCubit>()
                  //     .changeImage(imageSourcePath);
                },
                child: const CircleAvatar(
                  backgroundColor: Color(0xff18587A),
                  child: Icon(Icons.edit, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
