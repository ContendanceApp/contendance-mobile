import 'package:flutter/material.dart';

import 'package:indent/indent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bulleted_list/bulleted_list.dart';

import '../constant/theme.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String privacyPolicy =
      "Contendance Group built the Contendance app as a Free app. This SERVICE is provided by Contendance Group at no cost and is intended for use as is.\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Contendance unless otherwise defined in this Privacy Policy.";

  String informationCollection =
      "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.\nThe app does use third-party services that may collect information used to identify you.";

  String logData =
      "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.";

  String cookies =
      "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.";

  String linksOther =
      "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.";

  String childrensPrivacy =
      "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.";

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Privacy Policy",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Privacy Policy",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            privacyPolicy.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Information Collection and Use",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            informationCollection.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          Text(
            "Link to the privacy policy of third-party service providers used by the app",
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text(
              'Google Play Service',
              textAlign: TextAlign.justify,
              style: fontInter.copyWith(
                fontWeight: fwRegular,
                fontSize: 16,
                color: colorPrimaryBlue,
              ),
            ),
            onTap: () => launchUrl(
              Uri.parse("https://www.google.com/policies/privacy/"),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            child: Text(
              'AdMob',
              textAlign: TextAlign.justify,
              style: fontInter.copyWith(
                fontWeight: fwRegular,
                fontSize: 16,
                color: colorPrimaryBlue,
              ),
            ),
            onTap: () => launchUrl(
              Uri.parse(
                  "https://support.google.com/admob/answer/6128543?hl=en"),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            child: Text(
              'Google Analytics for Firebase',
              textAlign: TextAlign.justify,
              style: fontInter.copyWith(
                fontWeight: fwRegular,
                fontSize: 16,
                color: colorPrimaryBlue,
              ),
            ),
            onTap: () => launchUrl(
              Uri.parse("https://firebase.google.com/policies/analytics"),
            ),
          ),
          Text(
            "",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Log Data",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            logData.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Cookies",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            cookies.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Service Providers",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "We may employ third-party companies and individuals due to the following reasons:",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          BulletedList(
            bullet: Icon(
              Icons.circle,
              color: colorPrimaryBlack,
              size: 8,
            ),
            style: TextStyle(
              fontSize: 16,
              color: colorSubText,
            ),
            listItems: const [
              "To facilitate our Service;",
              "To provide the Service on our behalf;",
              "To perform Service-related services; or",
              "To assist us in analyzing how our Service is used.",
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingXl,
          ),
          Text(
            "Links to Other Sites",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            linksOther.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Children’s Privacy",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            linksOther.indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Changes to This Privacy Policy",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            ("We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.")
                .indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Changes to This Privacy Policy",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            ("We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.")
                .indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          Text(
            "This policy is effective as of 2022-05-29",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Contact Us",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            ("If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at contendance@gmail.com.")
                .indent(5),
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
