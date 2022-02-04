import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/login_page.dart';
import 'package:flutter_auth/screens/reset_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print("users çıktı");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff232323),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 64),
        child: Column(
          children: [
            Text("Profile Page",
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(
              height: 16,
            ),
            Image.asset(
              "assets/images/profile.png",
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "${auth.currentUser!.email}",
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
            createButton("Reset Password", const Icon(Icons.password_outlined),
                const Color(0xff232323), resetPassword),
            createButton("Delete Account", const Icon(Icons.delete),
                const Color(0xff232323), deleteAccount),
            createButton("Logout", const Icon(Icons.login_outlined),
                const Color(0xff232323), logout),
          ],
          /*Reset Passoword,Çıkış,Mail Değiştirme,Hesap Silme */
        ),
      ),
    );
  }

  void resetPassword() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResetPage()));
  }

  void deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  void logout() async {
    await auth.signOut();
  }

  createButton(var text, Icon icons, Color color, onPres) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPres,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            icons,
          ],
        ),
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(350, 60)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
