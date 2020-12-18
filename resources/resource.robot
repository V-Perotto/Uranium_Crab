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
    Screenshot          endshot         ${EMPTY}
    Close Browser