import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Title(
            color: Colors.black, child: Text('''
      
      








      
      **App Name:** Daily Stint
      
      **Description:**
      Daily Stint is your personalized daily work planner, empowering you to take control of your day. Tailor your own daily plan or explore expert-curated suggestion plans to boost productivity and achieve your goals.
      
      **Key Features:**
      - **Custom Work Plans:** Craft your own daily schedule, aligning with your unique tasks and priorities.
      - **Expert Suggestions:** Access pre-designed work plans crafted by productivity experts to optimize your day.
      - **Goal Tracking:** Set and monitor daily goals to stay focused and motivated.
      - **Reminders and Notifications:** Receive timely reminders to stay on track throughout the day.
      - **Progress Insights:** Gain insights into your productivity and accomplishments over time.
      
      **Target Audience:**
      Professionals, students, and anyone seeking a personalized and efficient way to organize daily tasks and enhance productivity.
      
      **Benefits:**
      - Effortlessly organize your daily routine.
      - Achieve more by following personalized or expert-curated plans.
      - Enhance time management skills.
      - Track progress and celebrate daily achievements.
      
      **Platform Compatibility:**
      Available on iOS and Android.
      
      **Release Date:**
      [1/2/2024]
      
      **Version Number:**
      [Version 0.0.1]
      
      **Developer Information:**
      Developed by [fouzan]
      Contact: [fouzanparammal2@gmail.com]
      
      
      **User Reviews and Ratings:**
      Check out what users are saying about Daily Stint. []
      
      **Privacy Policy and Permissions:**
      Read our privacy policy to understand how we handle your data. Daily Stint requires [List any necessary permissions].
      
      
      
      **Updates and Patch Notes:**
      Stay tuned for updates! We're continuously enhancing Daily Stint to provide you with the best planning experience. [Include recent patch notes]
            
       ''')),
        ),
      ),
    );
  }
}