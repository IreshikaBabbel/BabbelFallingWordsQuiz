Project Clone/ Download

Project is publicly available in below GitHib location
https://github.com/IreshikaBabbel/BabbelFallingWordsQuiz
git clone: https://github.com/IreshikaBabbel/BabbelFallingWordsQuiz.git

Instructions to project run
Please open the project from BabbelFallingWordsQuiz-master-> BabbelFallingWordsQuiz.xcworkspace

Problem 

OPTION 01 challenge: Falling Words
The task is to write a small language game. The player will see a word in language „one“ on the screen. While this word is displayed, a word in language „two“ will fall down on the screen. The player will have to choose if the falling word is the correct translation or a wrong translation. The player needs to answer, before the word reaches the bottom of the screen. A counter that gives the player feedback should be included.

how much time was invested

Completed functionalities with basic UIImplementation : 6 hours
UI enhancement  and addiitonal features: 3 hours

Main focus was to complete functionality with the basic UI implemntation. After completing the functinalities in unit tests , focused on the additinal UI enhancments

how was the time distributed (concept, model layer, view(s), game mechanics

•    Concept & Logic    4 Hour
•    Model Layer    30 min
•    UI implementation    3 Hours
•    Unit Tests    20 min
•    Feature enhancements
 . UI Enhancements: Users’ ability to select word count 1.5 hours


decisions made to solve certain aspects of the game

1.    Word Count Selection
Given words.json file contained around 276 word. Asking user to play until whole number of word count complete is not a good user experience.So at the beginning of the application user can select ,how many number of words user needs to play
2.    Back button implementation
As an alternative to Quit button back button has given , then user can go back and start a new game
3.    Automatic animation based on user selection on answers
If user select an answer, user will automatically navigate to the next animation. Because of this user don’t need to wait until the current animation completes.
4.    User skip a word from selecting
If user doesn’t select an answer, then after the completion of animation next word will automatically display
5.    Language identification
Selected language is clearly visible to the user since it displayed in the view.
6.    Feedback on incorrect answer
Incorrect answer selection gives a shake animation on the screen to notify user
7.    Users focus on the game according to importance are displaying
8.    Feedback after the completion on the game
User can see final score and the achievement state which can motivate user to use application frequently
9.    Retry Option
After completion of the game user can always retry the game , which can help user to play more and score more
10.    Read words.json file as an async call
Words.josn file can contain more data which can consume time on file reading. .json file reads as an async to avoid delay which can cause from this.  


decisions made because of restricted time

1.    Application only supports iPhones in portrait made
2.    Application doesn’t have login option which can help multiplayer login 
3.    Words.josn file reads from application not from a server
4.    UI implementation is very simple
5.    Game only contains one level 
6.    Language option is pre-selected. User can’t switch languages in view
7.    Application doesn’t support online / offline behavior
8.    Application doesn’t store previous user scores or doesn’t have a cashing mechanism
9.    There isn’t any feedback from application if user tries to quit the application
10.    There isn’t any cancel button to user to exist from current game
11.    If user quit the application while playing the application current status won’t be save and it won’t appear at the next time user login to the application. (Application doesn’t have a local database to save user status)


what would be the first thing to improve or add if there had been more time

Online-Offline functionality
 Because currently words.json file is inbuilt to application which restricts user access to updated data. User should have access to backend at the time user is online and once user is in offline mode , user can play with latest updated words which are cashed in mobile application

