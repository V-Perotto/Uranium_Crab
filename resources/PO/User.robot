*** Settings ***
Resource            ../resource.robot  

*** Variable ***
${H2_USER}              xpath=//h2[contains(text(), "${TARGET}")]
# ${SEARCH}               xpath=//input[@placeholder]

*** Keywords ***
Search Target
    Go To                           https://www.instagram.com/${TARGET}
    Wait Until Element Is Visible   ${H2_USER}