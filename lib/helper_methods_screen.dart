import 'package:flutter/material.dart';
import 'package:flutter_course/custom_widgets/custom_button.dart';
import 'package:flutter_course/utils/helper_methods.dart';

class HelperMethodsScreen extends StatefulWidget {
  const HelperMethodsScreen({super.key});

  @override
  State<HelperMethodsScreen> createState() => _HelperMethodsScreenState();
}

class _HelperMethodsScreenState extends State<HelperMethodsScreen> with HelperMethods {

  @override
  void initState() {
    super.initState();
  testHelperMethods();

  }



  void testHelperMethods() {
    String? nullableString = "test";
    print("✅ Randon Number: ${generateRandom(15, 56)}");

    print("✅ String is not null or empty: ${HelperMethods.isNotNullOrEmpty(nullableString)}");

    print("🎨 Hex to Color: ${HelperMethods.hexToColor('#FF5733')}");

    print("💰 Format currency: ${HelperMethods.formatCurrency('999')}");

    print("📅 Format date: ${HelperMethods.formatDate(DateTime.now())}");

    print("📅 From timestamp: ${HelperMethods.formatDateFromTimestamp(DateTime.now().millisecondsSinceEpoch)}");

    print("🔤 Capitalize: ${HelperMethods.capitalize('hello world')}");

    print("🔠 Initials: ${HelperMethods.getInitials('John Doe')}");

    print("✂️ Truncate: ${HelperMethods.truncateText('This is a long sentence that needs truncation.', maxLength: 25)}");

    print("🔢 With commas: ${HelperMethods.formatWithCommas(123456789)}");

    print("👍 Bool to Yes/No: ${HelperMethods.boolToYesNo(true)}");

    // Note: showSnackBar can't be demonstrated in a test method – requires BuildContext

    print("🚫 Clean whitespace: '${HelperMethods.cleanWhiteSpace('  Hello   World  ')}'");

    print("📝 Title case: ${HelperMethods.toTitleCase('flutter is amazing')}");

    print("💾 File size: ${HelperMethods.formatFileSize(1048576)}"); // 1MB

    print("⏱️ Time ago: ${HelperMethods.timeAgo(DateTime.now().subtract(Duration(minutes: 45)))}");

    print("📧 Email valid: ${HelperMethods.isValidEmail('test@example.com')}");

    print("📱 Format phone: ${HelperMethods.formatPhone('9876543210')}");

    print("🔢 Extract digits: ${HelperMethods.extractDigits('Phone: +91-98765-43210')}");

    print("🔣 Parse int: ${HelperMethods.parseInt('1234')}");

    print("🔣 Parse double: ${HelperMethods.parseDouble('12.34')}");

    print("🎲 Generate random number: ${generateRandom(10, 100)}");
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomButton(
              label: "Print Random Number",
              onPressed: () {

                var number = generateRandom(10, 15);
                print("Number $number");
              }),
          SizedBox(height: 12,),


        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
