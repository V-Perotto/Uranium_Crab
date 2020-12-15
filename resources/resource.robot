*** Settings ***
Library        SeleniumLibrary
Library        DateTime

*** Variables ***
${BROWSER}     firefox

*** Keywords ***
Get DateTime
    ${GETDATE}              Get Current Date    result_format=%Y-%m-%d %H-%M-%S
    [Return]                ${GETDATE}

### SETUP
Open Page
    ${DATE}                 Get DateTime
    Set Global Variable     ${Path}  ${CURDIR}/Uranium_Crab/captures/${DATE}
    Open Browser            about:blank     ${BROWSER}

### TEARDOWN
Close Page
    Close Browser

Screenshot
  [Arguments]  ${filename}
  Set Screenshot Directory  ${Path}
  Wait Until Page Contains  Element
  Capture Page Screenshot  ${filename}.png
  Log To Console  ${\n}Screenshot