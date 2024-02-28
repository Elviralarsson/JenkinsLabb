*** Settings ***
Documentation   Main File For TestCases
Library    SeleniumLibrary
Library     Collections
Resource    BookingCarRecources.robot
Suite Setup    BrowserSetUp       ${url}


*** Test Cases ***
LogInAndBookCar
    [Documentation]    Logging in and booking a car
    [Tags]             VG_test   LogInBookCar
    Given I Logg In          ${userEmail}    ${userPassword}
    When I'm Booking a Car
    And Filled In The Information    ${cardNumber}  ${cardHolder}  ${cvc}
    Then My Car Should Be Visible
    And Then I Cancel
    And I Log Out



CancelBookedCar
    [Documentation]    Book a car and then cancel it
    [Tags]    CancelBooking
    Given I Logg In                ${userEmail}    ${userPassword}
    When I'm Booking A Different Car
    And Filled In The Information   ${cardNumber}  ${cardHolder}  ${cvc}
    Then My Car Should Be Visible
    And Then I Cancel
    And I Log Out


Checking the About page
    [Documentation]    Testing A Feature Navigating The Site
    [Tags]            WebTesting
    Given I Go To Website
    When I Check About
    Then I Go Back To Start Page

Book car without logging in
    [Documentation]    I Try Booking The Car Without LogIn
    [Tags]    NegativeTest1
    Given I Choose Date
    When Finding A Car
    Then I Try To Book The Car

Login With Wong Email
    [Documentation]    Trying to log in with wrong email
    [Tags]    NegativeTest2
    Given I Choose Date      
    When I Try Log In            ${wrongEmail}    ${userPassword}
    Then I Logg In        ${userEmail}    ${userPassword}




######################################################################################################################











