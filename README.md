This is a basic accounting program that allows the user to input their own .csv file of formatted data. Through the web interface the user can view total spent and averages of any account by spending category. They can also manipulate all aspects of the accounting data (given that it stays within the parameters of the formatted .csv file).

SETUP
The user will need to provide their own properly formatted .csv file of data. For example see the 'accounts.csv' file in the main directory. This file will work with the program using sample information. To provide your own .csv file, simply replace the sample file with your own (rename your own to 'accounts.csv'). It is recomended that you move the sample file into a new folder in case you need to reference back to it. After this simply run the program using a Ruby Sinatra web server. The program can be started by running the 'web.rb' file.

ADDING USERS
User are hard-coded to the file 'users.csv' in the views folder. In order to add (or remove) users for login, simply edit the file. Use the structure "username,password" on a single line.

HOW TO USE
After going to the location your Sinata server is running, you should see a login page. Login using a valid login from 'users.csv' (or else you will get a login error). Once logged into the program, you will be greeted with a "success" page. You can use the navigation menu at the top to either view account spending breakdowns, or edit stored transactions. Use the logout button at the right of the navigation menu to logout and return to the login page. Attempting to access any of the navigation menu options before login will stop the user and remind them that they need to login.