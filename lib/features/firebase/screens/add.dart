import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/firebase/controllers/add.dart';
import 'package:tproject/features/firebase/models/post.dart';

class FirebaseAddPostScreen extends StatelessWidget {
  const FirebaseAddPostScreen({
    super.key,
    this.post,
  });

  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseAddPostController(post: post));
    final isEdit = post != null;

    return MainLayout(
      label: 'Добавить пост',
      hasArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: c.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GFButton(text: 'Выбрать изображение', onPressed: () => c.selectImage()),
                Obx(() {
                  return c.image.value != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: GFImageOverlay(
                            image: AssetImage(c.image.value!.path),
                            height: 200,
                            width: double.infinity,
                            boxFit: BoxFit.cover,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
                const SizedBox(height: 15),
                UIInput(
                  'Имя',
                  c.nameInput,
                  validate: [VRules.required()],
                ),
                const SizedBox(height: 30),
                UIButton(
                  isEdit ? 'Изменить' : 'Добавить',
                  () => isEdit ? c.edit() : c.add(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
