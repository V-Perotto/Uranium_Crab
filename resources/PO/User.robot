*** Settings ***
Resource            ../resource.robot  

*** Variable ***
${H2_USER}              xpath=//h2[contains(text(), "uranium_crab")]
${LINK_FOLLOWERS}       xpath=//a[@href="/uranium_crab/followers/"]
${LINK_FOLLOWING}       xpath=//a[@href="/uranium_crab/following/"]
${NUMBER_FOLLOWERS}     xpath=//a[@href="/uranium_crab/followers/"]/span[contains(text(), "1")]
${NUMBER_FOLLOWING}     xpath=//a[@href="/uranium_crab/following/"]/span[contains(text(), "1")]

*** Keywords ***
