*** Settings ***
Resource        ../resource.robot

*** Variables ***
### ELEMENTS
${SECTION_SAVE}     xpath=//section[@class="ABCxa"]
${BUTTON_NOTNOW}    xpath=//button[contains(text(),"Agora não")]
${LINK_USER}        xpath=//a[contains(text(), "uranium_crab")]

*** Keywords ***