*** Settings ***
Resource        ../resources/PO/Following.robot
Resource        ../resources/PO/Home.robot
Resource        ../resources/PO/Login.robot
Resource        ../resources/PO/User.robot
Resource        ../resources/resource.robot

Test Setup      Open Page
Test Teardown   Close Page

*** Test Case ***
Testgram 01: Sign In Instagram
    Login.Insert Data To Sign In
    Home.Cancel Automatic Login
    User.See Followers
    User.Click User
    Following.Save Highlights
    Following.Catch All Posts