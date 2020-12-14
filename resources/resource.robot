*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}     firefox

*** Keywords ***
### SETUP
Open Page
    Open Browser    about:blank     ${BROWSER}
### TEARDOWN
Close Page
    Close Browser