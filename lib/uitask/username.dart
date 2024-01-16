import 'package:flutter/material.dart';

class AddInformation extends StatelessWidget {
  const AddInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [BackButton(), Text('Add Information')],
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  // width: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.asset(
                      'assets/Profile.png',
                      // height: 40,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 3,
                    right: 15,
                    child: Container(
                      width: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Text('Upload your photos to meet friends easier',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff544F4F))),
            SizedBox(
              height: 15,
            ),
            _commonTextField(
              hint: 'UserName',
            ),
            SizedBox(
              height: 15,
            ),
            _commonTextField(
                hint: 'Birthdate', keyboardType: TextInputType.datetime),
            SizedBox(
              height: 15,
            ),
            _commonTextField(
              hint: 'English',
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.male), Text('Male')],
                  ),
                ),
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.female), Text('Female')],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 55,
              width: 382,
              decoration: BoxDecoration(
                  color: Color(0xff00D42F),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commonTextField(
      {TextEditingController? controller,
      String? hint,
      TextInputType? keyboardType,
      dynamic onTap}) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: '$hint',
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
      ),
    );
  }
}
