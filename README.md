# HandongSAM_Project
* Mobile Application Development Final Project With HandongSAM Corporation.

# Introduction of this Project
* This Project is developed with cooperation with HandongSAM Corporation. With the requirements given from Mobile Application Development(Professor SungBae Jo) and HandongSAM Corporation, HandongSAM Project worked to fulfill those requirments as first priority. 

  1. Mobile Application Development Requirements: Try to use what we have learned in classes. One of functions that had to be used is to connect with firebase database system. And with connection to database system, we need to be able to use login system with one of google, anonymous or whatever else.
  2. HandongSAM Requirments: User-friendly Application. Try to develop Application that user can easily approach. It is not recommended to use lot of texts. Instead try to fill the page with images or graphs or any other visual effects. It is very important to have diary system and alarm system implemented. And results of diary has to be visualized so that user can feel something from it.

# Design Tools, Language, Framework and Database System Used
* Programming Language: Dart Language
* Framework: Flutter: Cross-Platform Framework that supports multiple Operating System includes Android, IOS and even Web.
* Database System: Firebase Database System
* Design Tools: Figma (https://www.figma.com/file/oBZGN83OtTHKzI1Tt4epOx/HandongSAM)

# Main Functions
* Alarm System (Notification for version 2.0)
* Visualization Techniques

# Visualization of this program.
Used Pie Chart, Bar Chart, Percentage Chart and Gauge Chart.

# What is stored in Firebase Database System?
> In Firebase database system, databse named "Daily_Record" is given. When you first login, 'login.dart' file will create new document with user's id.
> In Document, it will store alarm time which user will select when he/she will choose, variables for counting how many surveys user have completed, submitted time of survey confirmed, and all the answers of surveys,
> After survey, stress value, count of how many days he/she drank, sum of hours of sleep, sum of values of dump status, string arrays of morning, lunch, dinner, stress value, defecation feeling, number of defecation.

# Versions
* 1.0: Connecting to database system and visualize it to graph, chart using plugins.

* 2.0:

  1. ML-kit: If user uploads image through image picker, image will be stored on firebase storage, and if the image has the word "With water", then it will return 1, else return 0. After return, it will be stored in string array named ml. On Final result, it will be displayed in visual.dart page with percentage of how many times the user has eaten bio-food.
  2. Alarm Notification: On version 1.0, it is only possible to set and manage alarm time. From ver 2.0, you will be able to get real alarm Notification.

* 3.0:

  1. Kakaotalk Login: Login with kakaotalk. Since kakaotalk is one of the best application that is being used by people, kakaotalk login will be supported from 2.0

# CONTRIBUTORS:
* 21400022 Younhong Ko
* 21500802 Youngjun Hong
