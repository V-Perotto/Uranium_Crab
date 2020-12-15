*** Settings ***
Resource       ../file.robot
Library        SeleniumLibrary

*** Variables ***
${BROWSER}     firefox

*** Keywords ***
### SETUP
Open Page
    Get DateTime 
    Open Browser        about:blank     ${BROWSER}

### TEARDOWN
Close Page
    Screenshot          ariany
    Close Browser