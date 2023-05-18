import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_image_editor/widgets/edit_image_viewmodel.dart';

import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  final String myselectedImage;
  const EditImageScreen({Key? key, required this.myselectedImage})
      : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                tooltip: 'Save Image',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                tooltip: 'Increase font size',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                tooltip: 'Decrease font size',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                tooltip: 'Align Left',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                ),
                tooltip: 'Align Center',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                ),
                tooltip: 'Align Right',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                tooltip: 'Bold',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                tooltip: 'Italic',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                tooltip: 'Add New Line',
              ),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Orange',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Pink',
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              //for displaying image
              Center(
                child: Image.file(
                  File(
                    widget.myselectedImage,
                  ),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              for (int i = 0; i < texts.length; i++)
                //for text
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    //on pressing that text
                    onLongPress: () {
                      print('Long press detected');
                    },
                    onTap: () => setCurrentIndex(
                      context,
                      i,
                    ),
                    child: Draggable(
                      feedback: MyImageText(textInfo: texts[i]),
                      child: MyImageText(textInfo: texts[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy - 96;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myaddNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add new text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
