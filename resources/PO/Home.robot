*** Settings ***
Resource        ../resource.robot

*** Variables ***
### ELEMENTS
${SECTION_SAVE}         xpath=//section[@class="ABCxa"]
${BUTTON_NOTNOW}        xpath=//button[contains(text(),"Agora não")]
${LINK_USER}            xpath=//a[contains(text(), "${USERNAME}")]

*** Keywords ***
Cancel Automatic Login
    Wait Until Element Is Visible   ${SECTION_SAVE}
    Wait Until Element Is Visible   ${BUTTON_NOTNOW}
    Click Element                   ${BUTTON_NOTNOW}
    Wait Until Element Is Visible   ${LINK_USER}
    Click Element                   ${BUTTON_NOTNOW}
    Click Element                   ${LINK_USER}