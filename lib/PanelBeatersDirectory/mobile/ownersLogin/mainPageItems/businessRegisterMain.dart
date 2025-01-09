import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/registerBusinessItems/membershipOptionsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/registerBusinessContainer.dart';

class BusinessRegisterMain extends StatelessWidget {
  const BusinessRegisterMain({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightDevice,
        width: widthDevice,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobileLanding.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 75,
                      width: 155,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/panelLogo.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //VerifyYourEmailMobile(),
              RegisterBusinessContainer(child: MembershipOptionsMobile()
                  //WhatsNextMobile()
                  //CompleteAgreementMobile()
                  //CreateProfileMobile()
                  //EnterVerificationMobile(),
                  ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Effortless Management',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice / 8,
                    fontFamily: 'ralewaybold',
                    height: 0.9,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'More time for repairs, less time on admin. Customize and manage your online profile anytime, anywhere!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice / 25,
                    fontFamily: 'raleway',
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
