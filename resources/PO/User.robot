*** Settings ***
Resource            ../resource.robot  

*** Variable ***
${H2_USER}              xpath=//h2[contains(text(), "${USERNAME}")]
${LINK_FOLLOWERS}       xpath=//a[@href="/${USERNAME}/followers/"]
# ${LINK_FOLLOWING}       xpath=//a[@href="/uranium_crab/following/"]
# ${NUMBER_FOLLOWERS}     xpath=//a[@href="/uranium_crab/followers/"]/span[contains(text(), "1")]
# ${NUMBER_FOLLOWING}     xpath=//a[@href="/uranium_crab/following/"]/span[contains(text(), "1")]
${LINK_USER-F}          xpath=//a[@title="${TARGET}"]

*** Keywords ***
See Followers
    Wait Until Element Is Visible   ${H2_USER}
    Click Element                   ${LINK_FOLLOWERS}

# See Followings
#     Wait Until Element Is Visible   ${H2_USER}
#     Click Element                   ${LINK_FOLLOWING}

Click User
    Wait Until Element Is Visible   ${LINK_USER-F}
    Click Element                   ${LINK_USER-F}