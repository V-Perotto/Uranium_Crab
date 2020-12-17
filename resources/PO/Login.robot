*** Settings ***
Resource        ../../sensive/sensive.robot
Resource        ../resource.robot

*** Variables ***
### ELEMENTS
${URL}              https://www.instagram.com/?hl=pt-br
${INPUT_USER}       xpath=//input[@name="username"]
${INPUT_PASS}       xpath=//input[@name="password"]
${BUTTON_SUBMIT}    xpath=//button[@type="submit"]                    

*** Keywords ***
Insert Data To Sign In
    Go To                               ${URL}
    Wait Until Element Is Visible       ${INPUT_USER}
    Input Text                          ${INPUT_USER}     ${USERNAME}
    Input Text                          ${INPUT_PASS}     ${PASSWORD}
    Click Element                       ${BUTTON_SUBMIT}
    Sleep                               2