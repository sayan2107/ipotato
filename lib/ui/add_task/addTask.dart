import 'package:flutter/material.dart';
import 'package:ipotato_timer/constants/colors.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';
import 'package:ipotato_timer/widgets/add_task/text_input_widget.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  static const String route = '/addTask';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String title = "";
  String description = "";

  int? durationHour;
  int? durationMin;
  int? durationSec;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MultiTimer>(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add task",
                        style: AppTextTheme.of(context).h1,
                      ),
                      const SizedBox(height: 20),
                      TextInputWidget(
                        label: 'Title',
                        hintText: 'Enter title',
                        onChangeCallBack: (String data) {
                          setState(() {
                            title = data;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      TextInputWidget(
                        maxLine: 6,
                        hintText: 'e.g. john@gmail.com',
                        label: 'Description',
                        onChangeCallBack: (String data) {
                          setState(() {
                            description = data;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Duration",
                        style: AppTextTheme.of(context)
                            .h6
                            .copyWith(color: AppColors.darkGray),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _durationInput(
                            onChange: (String data) {
                              setState(() {
                                durationHour = int.tryParse(data);
                              });
                            },
                            unitText: 'HH',
                          ),
                          const Text(" : "),
                          _durationInput(
                            onChange: (String data) {
                              setState(() {
                                durationMin = int.tryParse(data);
                              });
                            },
                            unitText: 'MM',
                          ),
                          const Text(" : "),
                          _durationInput(
                            onChange: (String data) {
                              setState(() {
                                durationSec = int.tryParse(data);
                              });
                            },
                            unitText: 'SS',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) => !_isValid()
                        ? Colors.grey.withOpacity(0.2)
                        : AppColors.lightPurple,
                  ),
                ),
                onPressed: !_isValid()
                    ? null
                    : () {
                        store.addTimer(
                          duration: Duration(
                            hours: durationHour ?? 0,
                            minutes: durationMin ?? 0,
                            seconds: durationSec ?? 0,
                          ),
                          description: description,
                          title: title,
                        );
                        Navigator.of(context).pop();
                      },
                child: Text(
                  'Add Task',
                  style: AppTextTheme.of(context)
                      .h5
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isValid() {
    if (title.isNotEmpty &&
        description.isNotEmpty &&
        (durationMin != null || durationHour != null || durationSec != null)) {
      return true;
    }
    return false;
  }

  Widget _durationInput({
    required Function(String) onChange,
    required String unitText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: TextFormField(
            maxLength: 2,
            keyboardType: TextInputType.number,
            onChanged: onChange,
            style: const TextStyle(
              fontSize: 20.0,
              height: 1.0,
              color: AppColors.darkGreen,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              counterText: "",
              fillColor: AppColors.lightGreen,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(unitText)
      ],
    );
  }
}
