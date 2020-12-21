*** Settings ***
Resource       resources/PO/Target.robot
Library        DateTime
Library        ExcelLibrary
Library        OperatingSystem
Library        String

*** Keywords ***
Get DateTime
    ${GETDATE}                              Get Current Date        result_format=_%d-%m-%Y_[%H;%M;%S]
    [Return]                                ${GETDATE}

### EXCEL FILES
File Exists
    [Arguments]                             ${TARGET.name}           ${TARGET.attribute}
    Append To File                          path=${CURDIR}/data/     content=${TARGET.name}-${TARGET.attribute}.xlsx     encoding=UTF-8
    File Should Exist                       path=${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx
    Open Excel File                         ${TARGET}                ${ATTRIBUTE}
    Wait Until Element Is Visible           ${FOLLOWERS-BOX}

# Create Excel to Save Attribute
#     [Arguments]                             ${TARGET.name}          ${TARGET.attribute}
#     Create Excel Document                   doc_id=${TARGET.attribute}
#     Save Excel Document                     filename=${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx

Open Excel File
    [Arguments]                             ${TARGET.name}          ${TARGET.attribute}
    Open Excel Document                     filename=${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx         doc_id=${TARGET.attribute}

Add Data In Excel File
    [Arguments]                             ${ROW.number}           ${FOLLOW.user}                           ${TARGET.attribute}
    Write Excel Row                         row_num=${ROW.number}   row_data=${FOLLOW.user}  col_offset=0    sheet_name=${TARGET.attribute}

### SCREENSHOTS FILES
Screenshot
    [Arguments]                             ${filename}     ${dir}         
    ${DATE}                                 Get DateTime
    Set Local Variable                      ${Path}         ${CURDIR}/captures/${dir}
    Set Screenshot Directory                ${Path}         
    Capture Page Screenshot                 ${filename}${DATE}.png