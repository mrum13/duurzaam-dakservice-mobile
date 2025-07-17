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
  final ImagePicker _picker = ImagePicker();
  final List<String> _optionsProbleem = [
    'Lekkage',
    'stormschade',
    'verourderd dak',
    'overig',
  ];
  String? _selectedOptionProbleem;
  final List<String> _optionsSchade = [
    'Binnen', 
    'Buiten', 
    'onbekend'
  ];
  String? _selectedOptionSchade;
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
                          hintText: "Uitleg probleem", prefixIcon: Icons.edit),
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
                          hintText: "Naam", prefixIcon: Icons.person),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          hintText: "Woonplaats", prefixIcon: Icons.domain),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          hintText: "Telefoonnummer", prefixIcon: Icons.call),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          hintText: "E-mailadres", prefixIcon: Icons.email),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
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
