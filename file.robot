*** Settings ***
Resource       resources/PO/Following.robot
Library        DateTime

*** Keywords ***
Get DateTime
    ${GETDATE}                      Get Current Date        result_format=_%d-%m-%Y_[%H;%M;%S]
    [Return]                        ${GETDATE}

Screenshot
    [Arguments]                     ${filename}
    ${DATE}                         Get DateTime
    Set Local Variable              ${Path}         ${CURDIR}/captures/profile
    Set Screenshot Directory        ${Path}         
    Wait Until Element Is Visible   ${HL_2}
    Capture Page Screenshot         ${filename}${DATE}.png

Postshot
    [Arguments]                     ${filename}
    ${DATE}                         Get DateTime
    Set Local Variable              ${Path}         ${CURDIR}/captures/posts
    Set Screenshot Directory        ${Path}         
    # Wait Until Element Is Visible   
    Capture Page Screenshot         ${filename}${DATE}.png

Endshot
    [Arguments]                     ${filename}
    ${DATE}                         Get DateTime
    Set Local Variable              ${Path}         ${CURDIR}/captures
    Set Screenshot Directory        ${Path}         
    # Wait Until Element Is Visible   ${HL_2}
    Capture Page Screenshot         ${filename}${DATE}.png