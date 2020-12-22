*** Settings ***
Resource        ../resources/PO/Target.robot
Resource        ../resources/PO/Home.robot
Resource        ../resources/PO/Login.robot
Resource        ../resources/PO/User.robot
Resource        ../resources/resource.robot

Test Setup      Open Page
Test Teardown   Close Page

*** Test Case ***
Caught Data: New Target
    Login.Insert Data To Sign In
    Home.Cancel Automatic Login
    User.Search Target
    Target.Save Profile Status
    Target.Save Attribute

# Caught Data: Saved Target
#     Login.Insert Data To Sign In
#     Home.Cancel Automatic Login
#     User.Search Target
#     Target.Save Profile Status