import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/firebase_service.dart';
import 'package:evently_application/models/category_data_model.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/modules/create%20event%20screen/tab_item_event_screen.dart';
import 'package:evently_application/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../widgets/text_form_field.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = "/create-event";

  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentIndex = 0;

  CategoryModel selectedCategory = CategoryModel.categories.first;
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('d/M/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Create Event",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/${selectedCategory.imageName}.png",
                    height: MediaQuery.sizeOf(context).height * 0.23,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              DefaultTabController(
                length: CategoryModel.categories.length,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 16),
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  tabs:
                      CategoryModel.categories
                          .map(
                            (category) => TabItemEventScreen(
                              label: category.name,
                              icon: category.icon,
                              isSelected:
                                  currentIndex ==
                                  CategoryModel.categories.indexOf(category),
                            ),
                          )
                          .toList(),
                  onTap: (index) {
                    if (currentIndex == index) return;
                    currentIndex = index;
                    selectedCategory = CategoryModel.categories[index];
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tittle",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 8),
                      DefaultTextFormField(
                        hintText: "Event Title",
                        prefixIconImageName: "tittle",
                        controller: tittleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Tittle can not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 8),
                      DefaultTextFormField(
                        hintText: "Event Description",
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Description can not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/date.svg"),
                          SizedBox(width: 10),
                          Text(
                            "Event Date",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  Duration(days: 365),
                                ),
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                              );
                              if (date != null) {
                                selectedDate = date;
                                setState(() {});
                              }
                            },
                            child: Text(
                              selectedDate == null
                                  ? "Choose Date"
                                  : dateFormat.format(selectedDate!),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/time.svg"),
                          SizedBox(width: 10),
                          Text(
                            "Event Time",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) {
                                selectedTime = time;
                                setState(() {});
                              }
                            },
                            child: Text(
                              selectedTime == null
                                  ? "Choose Time"
                                  : selectedTime!.format(context),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Location",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/location.svg",
                              width: 46,
                              height: 46,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 13.5),
                            Text(
                              "Choose Event Location",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: "Inter",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      DefaultElevatedButton(
                        text: "Add Event",
                        onPressed: createEvent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      EventModel event = EventModel(
        tittle: tittleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
        category: selectedCategory,
      );
      FirebaseService.createEvent(event).then((_) {
        Navigator.of(context).pop();
      });
    }
  }
}
