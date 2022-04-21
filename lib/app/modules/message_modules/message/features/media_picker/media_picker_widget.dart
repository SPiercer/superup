import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../message_input/widgets/media_tile.dart';
import 'media_picker_controller.dart';

class MediaPickerWidget extends StatelessWidget {
  final MediaPickerController mediaPickerController;
  const MediaPickerWidget({Key? key,required this.mediaPickerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(
                  Icons.close,
                ),
              ),
              const Text(
                "Content and tools",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox()
            ],
          ),
        ),
        Flexible(
          child: ListView(
            children: <Widget>[
              ModalTile(
                title: "Image",
                subtitle: "Share Photos",
                icon: Icons.image,
                onTap:()=> mediaPickerController.pickImage(ImageSource.gallery),
              ),
              ModalTile(
                title: "Video",
                subtitle: "Share Video",
                icon: Icons.video_call_sharp,
                onTap:()=> mediaPickerController.pickVideo(ImageSource.gallery),
              ),
              ModalTile(
                title: "File",
                subtitle: "Share files",
                icon: Icons.tab,
                onTap: () {},
              ),
              // ModalTile(
              //   title: "Contact",
              //   subtitle: "Share contacts",
              //   icon: Icons.contacts,
              //   onTap: () {},
              // ),
              // ModalTile(
              //   title: "Location",
              //   subtitle: "Share a location",
              //   icon: Icons.add_location,
              //   onTap: () {},
              // ),
              // ModalTile(
              //   title: "Schedule Call",
              //   subtitle: "Arrange a skype call and get reminders",
              //   icon: Icons.schedule,
              //   onTap: () {},
              // ),
              // ModalTile(
              //   title: "Create Poll",
              //   subtitle: "Share polls",
              //   icon: Icons.poll,
              //   onTap: () {},
              // )
            ],
          ),
        ),
      ],
    );

    // return CupertinoActionSheet(
    //   cancelButton: CupertinoActionSheetAction(
    //     child: const Text("Cancel"),
    //     onPressed: () {
    //       return Navigator.pop(ctx);
    //     },
    //   ),
    //   actions: [
    //     CupertinoActionSheetAction(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.image, size: 24),
    //           SizedBox(
    //             width: 15,
    //           ),
    //           Text("photo"),
    //         ],
    //       ),
    //       onPressed: () async {
    //         final picker = ImagePicker();
    //         final pickedFile =
    //             await picker.pickImage(source: ImageSource.gallery);
    //
    //         if (pickedFile != null) {
    //           if (File(pickedFile.path).lengthSync() >
    //               AppConstants.maxMediaSize) {
    //             File(pickedFile.path).deleteSync();
    //             InfoAlert().show(text: "file Is Too Large");
    //             Navigator.pop(ctx);
    //           }
    //           return Navigator.pop(
    //             ctx,
    //             {"type": "photo", "path": pickedFile.path},
    //           );
    //         }
    //         Navigator.pop(ctx);
    //       },
    //     ),
    //     CupertinoActionSheetAction(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.attach_file, size: 24),
    //           SizedBox(
    //             width: 25,
    //           ),
    //           Text("File"),
    //         ],
    //       ),
    //       onPressed: () async {
    //         final FilePickerResult? result =
    //             await FilePicker.platform.pickFiles();
    //         if (result != null) {
    //           if (File(result.files.first.path!).lengthSync() >
    //               AppConstants.maxMediaSize) {
    //             File(result.files.first.path!).deleteSync();
    //             InfoAlert().show(text: "file Is Too Large");
    //             return Navigator.pop(ctx);
    //           }
    //           return Navigator.pop(
    //             ctx,
    //             {"type": "file", "path": result.files.first.path},
    //           );
    //         }
    //         return Navigator.pop(ctx);
    //       },
    //     ),
    //     CupertinoActionSheetAction(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Icon(Icons.video_call, size: 24),
    //           SizedBox(
    //             width: 15,
    //           ),
    //           Text("Video"),
    //         ],
    //       ),
    //       onPressed: () async {
    //         final FilePickerResult? result =
    //             await FilePicker.platform.pickFiles(
    //           type: FileType.custom,
    //           allowedExtensions: ['mp4', 'mkv', 'avi', 'm4p', 'flv'],
    //         );
    //         if (result != null) {
    //           if (File(result.files.first.path!).lengthSync() >
    //               AppConstants.maxMediaSize) {
    //             File(result.files.first.path!).deleteSync();
    //             InfoAlert().show(text: "file Is Too Large");
    //             return Navigator.pop(ctx);
    //           }
    //           return Navigator.pop(
    //             ctx,
    //             {"type": "video", "path": result.files.first.path},
    //           );
    //         }
    //         return Navigator.pop(ctx);
    //       },
    //     ),
    //   ],
    // );
  }
}
