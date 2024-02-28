*** Settings ***
Documentation   resource fil for test av rental
Library    SeleniumLibrary
Library     Collections

######################################################################################################################

*** Variables ***
${url}                https://rental24.infotiv.net/
${userEmail}          RobotSelenium@mail.se
${userPassword}       Selenium
${cardNumber}         0202020202020202
${cardHolder}         Selenium
${cvc}                098
${wrongEmail}         MailRobot@mail.se

######################################################################################################################

*** Keywords ***
###Book A Car
BrowserSetUp
    [Documentation]    Opens Web Browser
    [Tags]            OpenBrowser
    [Arguments]    ${url}
    Open Browser    browser=Chrome
    Go To    ${url}
    Click Element        //*[@id="title"]
    Wait Until Element Is Visible     //*//*[@id="title"]

I Logg In
    [Documentation]    Rental Website  Login
    [Tags]            Login VG_test
    [Arguments]       ${userEmail}    ${userPassword}
    Start Page
    Input text    //*[@id="email"]        ${userEmail}
    Input Text    //*[@id="password"]     ${userPassword}
    Click Button                        //*[@id="login"]
    Wait Until Element Is Visible      //*[@id="welcomePhrase"]


I'm Booking a Car
   [Documentation]    Book A Car
   [Tags]            BookingCar   VG_test
    Click Element        //*[@id="start"]
    Click Element        //*[@id="end"]
    Click Button        //*[@id="continue"]
    Wait Until Element Is Visible           //*[@id="questionText"]
    Click Button     //*[@id="bookTTpass5"]
    Wait Until Element Is Visible    //*[@id="questionText"]

Filled In The Information
    [Documentation]    Filling Out Card Information
    [Tags]            CardInfo   VG_test
    [Arguments]    ${cardNumber}  ${cardHolder}  ${cvc}
    Input Text     //*[@id="cardNum"]  ${cardNumber}
    Input Text    //*[@id="fullName"]  ${cardHolder}
    Input Text    //*[@id="cvc"]       ${cvc}
    Click Button    //*[@id="confirm"]
    Wait Until Element Is Visible    //*[@id="confirmMessage"]/label

My Car Should be Visible
        [Documentation]    Se Car Booking
        [Tags]    BookedList  VG_test
        Click Button    //*[@id="mypage"]
        Wait Until Element Is Visible       //*[@id="unBook1"]

I Log Out
  [Documentation]    I'm logging out
  [Tags]    LoggOut   VG_test
  Click Button    //*[@id="logout"]
  Wait Until Element Is Visible    //*[@id="login"]

######################################################################################################################
####Cancel Car

I'm Booking a Different Car
   [Documentation]    Book A Car
   [Tags]            BookingCar   VG_test
    Click Element        //*[@id="start"]
    Click Element        //*[@id="end"]
    Click Button        //*[@id="continue"]
    Wait Until Element Is Visible           //*[@id="questionText"]
    Click Button     //*[@id="bookQ7pass5"]
    Wait Until Element Is Visible    //*[@id="questionText"]

I Cancel
    [Documentation]    Cancel The booking
    [Tags]    CancelBooking
    Click Button    //*[@id="mypage"]
    Wait Until Element Is Visible    //*[@id="licenseNumber1"]
    Click Button    //*[@id="unBook2"]
    Handle Alert
    Click Button    //*[@id="mypage"]
    Wait Until Element Is Not Visible    //*[@id="model2"]

######################################################################################################################
###Go Around In Website
I Go To Website
      [Documentation]    Checking out the website
      [Tags]    Webb
      Wait Until Element Is Visible    //*[@id="about"]
      Wait Until Element Is Visible    //*[@id="createUser"]

I Check About 
    [Documentation]    Checking About Site
    [Tags]    About
       Click Element    //*[@id="about"]
       Wait Until Element Is Visible    //*[@id="mainText"]/label

I Go Back To Start Page
    [Documentation]    Getting back to start page
    [Tags]    StartPage
    Click Element  //*[@id="title"]
    Wait Until Element Is Visible    //*[@id="questionText"]


######################################################################################################################
###Not Logged In
I Choose Date
    [Documentation]    I Choose Date
    [Tags]   Date
    Start Page
    Click Element        //*[@id="start"]
    Click Element        //*[@id="end"]
    Click Button        //*[@id="continue"]
    Wait Until Page Contains Element               //*[@id="questionText"]


Finding A Car
    [Documentation]    I Find the car I Want
    [Tags]    FindCar
    Wait Until Element Is Visible    //*[@id="carTable"]/tbody/tr[30]/td[2]
    Wait Until Element Is Visible    //*[@id="carTable"]/tbody/tr[29]/td[3]

I Try To Book The Car
    [Documentation]    I Try Booking The Car
    [Tags]    NegativeTest1
    Click Button    //*[@id="bookXC90pass5"]
    Handle Alert


######################################################################################################################
###Wrong In logg
I Try Log In
    [Documentation]    Trying to log in with wrong email
    [Tags]    NegativeTest2
    [Arguments]       ${wrongEmail}    ${userPassword}
    Start Page
    Input text    //*[@id="email"]        ${wrongEmail}
    Input Text    //*[@id="password"]     ${userPassword}
    Click Button                        //*[@id="login"]
    Wait Until Page Contains Element        //*[@id="signInError"]

    Wait
Start Page
    [Documentation]    Going to start page
     [Tags]    Start Page
     Click Element    //*[@id="title"]
     Wait Until Page Contains Element        //*[@id="questionText"]