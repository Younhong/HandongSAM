# HandongSAM Project
* Mobile Application Development Final Project With HandongSAM Corporation.

# Introduction of this Project
* This Project is developed with cooperation with HandongSAM Corporation. With the requirements given from Mobile Application Development(Professor SungBae Jo) and HandongSAM Corporation, HandongSAM Project worked to fulfill those requirments as first priority. 

  1. Mobile Application Development Requirements: Try to use what we have learned in classes. One of functions that had to be used is to connect with firebase database system. And with connection to database system, we need to be able to use login system with one of google, anonymous or whatever else.
  2. HandongSAM Requirments: User-friendly Application. Try to develop Application that user can easily approach. It is not recommended to use lot of texts. Instead try to fill the page with images or graphs or any other visual effects. It is very important to have diary system and alarm system implemented. And results of diary has to be visualized so that user can feel something from it.

# Design Tools, Language, Framework and Database System Used
* Programming Language: Dart Language
* Framework: Flutter: Cross-Platform Framework that supports multiple Operating System includes Android, IOS and even Web.
* Database System: Firebase Database System
* Design Tools: Figma: https://www.figma.com/file/oBZGN83OtTHKzI1Tt4epOx/HandongSAM

# Main Functions
* Alarm System (Notification for version 2.0)
* Diary System (Survey)
* Visualization Techniques (Pie chart, Bar chart, Percentage Gauge)

# What is stored in Firebase Database System?
> In Firebase database system, databse named "Daily_Record" is given. When you first login, 'login.dart' file will create new document with user's id.<br>
> In Document, it will store alarm time which user will select when he/she first logins, variables for counting how many surveys user have completed, the most recent submitted time, first submitted time, last submitted time, and all the answers of surveys.

# Version RoadMap
* 1.0:
  1. Manage all the user data using Firebase Database System.
  2. Survey using Slider, Radio Buttons.
  3. Setting alarm time using flutter_time_picker_spinner plugin.
  4. Visualize survey results using Bar Chart, Percentage Chart, Gauge Chart, Pie Chart using pie_chart, fl_chart, percent_indicator plugins.

* 2.0:
  1. ML-kit: If user uploads image through image picker, image will be stored on firebase storage, and if the image has the word "With water", then it will return 1, else return 0. After return, it will be stored in string array named ml. On Final result, it will be displayed in visual.dart page with percentage of how many times the user has eaten bio-food.
  2. Alarm Notification: On version 1.0, it is only possible to set and manage alarm time. From ver 2.0, you will be able to get real alarm Notification.
  3. Preserve data on Reset: Currently, if user wants to restart diary, all the survey result becomes initalized. From version 2.0, it will be modified as follows.
    > Create sub-collection on each user's document and name it 'Diary_Result'.
    > When the user logins for the first time, new variable named DiaryCount will be stored.
    > Every time the user submits diary, DiaryCount will be incremented by 1.
    > After submit, new Document, which will be named by the value of DiaryCount, will be created at 'Diary_Result' and all the survey results be stored in that document.

* 3.0:
  1. Kakaotalk Login: Login with kakaotalk. Since kakaotalk is one of the best application that is being used by people, kakaotalk login will be supported from 3.0
  2. Real Market System: Currently, if you press 'Buy' Button, it just moves on to the HandongSAM Web Page, but from ver 3.0, you will be able to buy products without moving to handongSAM webpage, but buy in mobile application.
  
# Demonstration Video
Youtube Link: https://youtu.be/21eHLPYtOSg

# CONTRIBUTORS:
* Younhong Ko
* Youngjun Hong
