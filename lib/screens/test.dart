
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 100, left: 32, right: 32, bottom: 100),
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white60,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter email or username",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 102, right: 102),
                  child: Text(
                    "Sign Up",
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "OR",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 52,
                    height: 52,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/facebook.png")),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0X9E9E9EE4),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  SizedBox(
                    width: 52,
                    height: 52,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/twitter.png")),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0X9E9E9EE4),
                          style: BorderStyle.solid,
                        ),
                      ),
// child: Image.asset("images/twitter.png")
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  SizedBox(
                    width: 52,
                    height: 52,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/search.png")),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0X9E9E9EE4),
                          style: BorderStyle.solid,
                        ),
                      ),
//    child: Image.asset("images/search.png")
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
