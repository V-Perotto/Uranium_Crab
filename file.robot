*** Settings ***
Resource       resources/PO/Target.robot
Library        DateTime
Library        ExcelLibrary

*** Keywords ***
Get DateTime
    ${GETDATE}                          Get Current Date        result_format=_%d-%m-%Y_[%H;%M;%S]
    [Return]                            ${GETDATE}

### EXCEL FILES
Create Excel to Save Followers
    [Arguments]         ${TARGET.name}
    Create Excel Document               doc_id=Followers
    Save Excel Document                 filename=${CURDIR}/data/${TARGET.name}-followers.xlsx
    Close All Excel Documents   

Create Excel to Save Followings
    [Arguments]         ${TARGET.name}
    Create Excel Document               doc_id=Followings
    Save Excel Document                 filename=${CURDIR}/data/${TARGET.name}-followings.xlsx
    Close All Excel Document

Create Excel to Save Posts
    [Arguments]         ${TARGET.name}
    Create Excel Document               doc_id=Posts
    Save Excel Document                 filename=${CURDIR}/data/${TARGET.name}-posts.xlsx
    Close All Excel Document

### SCREENSHOTS FILES
Profileshot
    [Arguments]                         ${filename}
    ${DATE}                             Get DateTime
    Set Local Variable                  ${Path}         ${CURDIR}/captures/profile
    Set Screenshot Directory            ${Path}         
    Wait Until Element Is Visible       ${HL_2}
    Capture Page Screenshot             ${filename}${DATE}.png

Postshot
    [Arguments]                         ${filename}
    ${DATE}                             Get DateTime
    Set Local Variable                  ${Path}         ${CURDIR}/captures/posts
    Set Screenshot Directory            ${Path}         
    # Wait Until Element Is Visible   
    Capture Page Screenshot             ${filename}${DATE}.png

Endshot
    [Arguments]                         ${filename}
    ${DATE}                             Get DateTime
    Set Local Variable                  ${Path}         ${CURDIR}/captures
    Set Screenshot Directory            ${Path}         
    # Wait Until Element Is Visible   ${HL_2}
    Capture Page Screenshot             ${filename}${DATE}.png