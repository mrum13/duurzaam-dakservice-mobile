import 'dart:math';

import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _problemController = TextEditingController();

  final TextEditingController _naanController = TextEditingController();
  final TextEditingController _woonplaatsController = TextEditingController();
  final TextEditingController _telefoonnummerController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isFilled = false;
  bool isLaoading = false;

  final ImagePicker _picker = ImagePicker();
  final List<String> _optionsProbleem = [
    'Lekkage',
    'stormschade',
    'verourderd dak',
    'overig',
  ];
  String? _selectedOptionProbleem;
  final List<String> _optionsSchade = ['Binnen', 'Buiten', 'onbekend'];
  String? _selectedOptionSchade;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _problemController.addListener(_validateFields);
    _naanController.addListener(_validateFields);
    _woonplaatsController.addListener(_validateFields);
    _telefoonnummerController.addListener(_validateFields);
    _emailController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      isFilled = _problemController.text.isNotEmpty &&
          _naanController.text.isNotEmpty &&
          _woonplaatsController.text.isNotEmpty &&
          _telefoonnummerController.text.isNotEmpty &&
          _emailController.text.isNotEmpty;
    });
  }

  void _submitForm() async {
    Random random = Random(); // Create a Random object
    int randomNumber = random.nextInt(
        5); // Generates a random integer between 0 (inclusive) and 100 (exclusive)

    setState(() {
      isLaoading = true;
    });

    await Future.delayed(Duration(seconds: randomNumber)).then(
      (value) {
        setState(() {
          isLaoading = false;
        });

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            // Mulai timer 3 detik setelah dialog muncul
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(); // Tutup dialog
            });
            return Dialog(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 56),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.green2Color,
                      size: 72,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Succes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Bestelling succesvol aangemaakt"),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.green1Color),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Neem vrijblijvend contact op",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Heeft u vragen en/of opmerkingen? Neem vrijblijvend contact op met onze dakdekkers, we helpen u graag!",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropdownButtonFormField<String>(
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                        hint: Text(
                          'Wat is het probleem?',
                          style: TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 14,
                          ),
                        ),
                        value: _selectedOptionProbleem,
                        items: _optionsProbleem.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedOptionProbleem = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          controller: _problemController,
                          hintText: "Uitleg probleem",
                          prefixIcon: Icons.edit),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _pickFromCamera(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.camera),
                                          const SizedBox(width: 8),
                                          Text("Camera"),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        minimumSize: Size(double.infinity, 44),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _pickFromGallery(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image),
                                          const SizedBox(width: 8),
                                          Text("Galerij"),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        minimumSize: Size(double.infinity, 44),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Add your image upload widget here
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: AppColors.darkBlueColor,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Probeer het probleem in beeld te brengen",
                                  style: TextStyle(
                                      color: AppColors.grayColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                        hint: Text(
                          'Waar zit de grootste schade?',
                          style: TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 14,
                          ),
                        ),
                        value: _selectedOptionSchade,
                        items: _optionsSchade.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedOptionSchade = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          controller: _naanController,
                          hintText: "Naam",
                          prefixIcon: Icons.person),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          controller: _woonplaatsController,
                          hintText: "Woonplaats",
                          prefixIcon: Icons.domain),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          controller: _telefoonnummerController,
                          hintText: "Telefoonnummer",
                          prefixIcon: Icons.call),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          controller: _emailController,
                          hintText: "E-mailadres",
                          prefixIcon: Icons.email),
                      const SizedBox(
                        height: 12,
                      ),
                      isLaoading
                          ? Center(
                              child: const CircularProgressIndicator(
                              color: AppColors.yellowColor,
                            ))
                          : ElevatedButton(
                              onPressed: isFilled ? _submitForm : null,
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    const Color.fromARGB(255, 244, 231, 173),
                                backgroundColor: AppColors.yellowColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Contact opnemen",
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickFromCamera(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      // Lakukan sesuatu dengan file photo
      print('Picked from camera: ${photo.path}');
    }
  }

  Future<void> _pickFromGallery(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Lakukan sesuatu dengan file image
      print('Picked from gallery: ${image.path}');
    }
  }
}
