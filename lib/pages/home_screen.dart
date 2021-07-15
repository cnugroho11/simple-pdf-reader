import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:simple_pdf_reader/pages/pdf_view_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _pdfPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple PDF Reader'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton (
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowedExtensions: ['pdf'],
                  type: FileType.custom
                );
                if(result != null) {
                  _pdfPath = result.files.single.path.toString();
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) => PdfViewScreen(pdfPath: _pdfPath,)));
                  print(_pdfPath);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'User cancelled file pick',
                      toastLength: Toast.LENGTH_SHORT
                    );
                  }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: Text('Pick PDF file'),
              ),
            )
          ],
        ),
      ),
    );
  }
}