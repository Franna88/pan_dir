import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceQuote.dart/serviceQuoteDetails.dart';

import '../../../../../myutility.dart';
import '../../../../desktop/components/descriptionDialog.dart';
import '../../../../emails/getQuote/sendGetQuote.dart';

class ServiceQuoteFormMobile extends StatefulWidget {
  String? listingsId;
  String? email;
  ServiceQuoteFormMobile(
      {super.key, required this.listingsId, required this.email});

  @override
  State<ServiceQuoteFormMobile> createState() => _ServiceQuoteFormMobileState();
}

class _ServiceQuoteFormMobileState extends State<ServiceQuoteFormMobile> {
  //var
  final ServiceQuoteDetails _controller = ServiceQuoteDetails();
  List<XFile> quoteItems = [];
  List<Map<String, dynamic>> galleryItems = [];
  XFile? _selectedImage;
  final _formKey = GlobalKey<FormState>();
  final _firestorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (quoteItems.length == 12) {
        descriptionDialog("Max image amount reached ");
      } else {
        _selectedImage = image;
        quoteItems.add(_selectedImage!);
      }
    });
    print(quoteItems);
  }

  removeImage(index) {
    setState(() {
      quoteItems.removeAt(index);
    });
  }

  getImageUrlList() async {
    List images = [];
    for (var image in quoteItems) {
      Uint8List data = await image!.readAsBytes();
      final storageRef = _firestorage.ref().child('listings/${image!.name}');
      final uploadTask = storageRef.putData(data);
      await uploadTask;
      images.add(image!.name);
    }
    return images;
  }

  sendEmail() {
    sendGetQuoteEmail(
        message: _controller.message.text,
        name: '${_controller.name.text} ${_controller.surname.text}',
        email: widget.email!);
  }

  submitQuote() async {
    var notificationData = {
      "id": "",
      "listingsId": widget.listingsId,
      "type": "Quote",
      "data": {
        "name": _controller.name.text,
        "surname": _controller.surname.text,
        "email": _controller.email.text,
        "contact": _controller.contact.text,
        "make": _controller.make.text,
        "model": _controller.model.text,
        "year": _controller.year.text,
        "insuranceCompany": _controller.insuranceCompany.text,
        "vin": _controller.vin.text,
        "message": _controller.message.text,
        "image": await getImageUrlList()
      },
      "title": "New Quote Request",
      "from": "${_controller.name.text} ${_controller.surname.text}",
      "priority": "low",
      "date": DateTime.now(),
      "read": false
    };
    await sendEmail();
    var doc = await _firestore
        .collection("notificationMessages")
        .add(notificationData);
    await FirebaseFirestore.instance
        .collection("notificationMessages")
        .doc(doc.id)
        .update({"id": doc.id}).whenComplete(() {
      Navigator.pop(context);
      descriptionDialog("Thank you. Your Notification has been Sent");
    });

    print(notificationData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MyUtility(context).width,
                  height: 55,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD17226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.09),
                        topRight: Radius.circular(8.09),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Request a Quote',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CloseButton(
                        style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Please fill in your detail below to request a free quote for panel beating services from, [Insert Shop Name]',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.6064,
                    fontFamily: 'ralewaybold',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MyUtility(context).width,
                    height: MyUtility(context).height * 0.35,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/requestQuoteImage.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Please note that all fields with * are compulsory',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16.6064,
                    fontFamily: 'ralewaybold',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.name,
                    headline: '*Name',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.surname,
                    headline: '*Surname',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.email,
                    headline: '*Email Address',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.contact,
                    headline: '*Contact',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.make,
                    headline: '*Make',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.model,
                    headline: '*Model',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.make,
                    headline: '*Make',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.model,
                    headline: '*Model',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.year,
                    headline: '*Year',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.insuranceCompany,
                    headline: '*Insurance Company(if applicable)',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.surname,
                    headline: '*VIN Number',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                ProfileTextField(
                    customWidth: MyUtility(context).width,
                    controller: _controller.message,
                    headline: '*Message',
                    customColor: Colors.black),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Attach up to 4 image of the damage',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    fontSize: 18,
                    fontFamily: 'ralewaybold',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Image limit: 12 images, max 2 Megabytes each. Prefer landscape format. Accepted file types: JPG, JPEG, PNG, GIF.',
                  style: TextStyle(
                    color: Color(0xFFD17226),
                    fontSize: 13.7364,
                    fontFamily: 'ralewaysemi',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                AddButton(
                  text: 'Add Image',
                  onPressed: () {
                    _pickImage();
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                quoteItems.isEmpty
                    ? const Center(
                        child: Text(
                          'No images found',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: [
                          for (var i = 0; i < quoteItems.length; i++)
                            QuoteImageStyle(quoteItems[i].path, i),
                        ],
                      ),
                SizedBox(
                  height: 8,
                ),
                AddButton(
                  text: 'Send',
                  onPressed: () {
                    submitQuote();
                  },
                ),
              ]),
        ));
  }

  Widget QuoteImageStyle(imagePath, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            fit: BoxFit.cover,
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 8,
          ),
          AddButton(
            text: 'Remove',
            onPressed: () {
              removeImage(index);
            },
          ),
        ],
      ),
    );
  }
}
