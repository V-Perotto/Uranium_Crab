*** Settings ***
Resource       resources/PO/Target.robot
Library        DateTime
Library        ExcelLibrary
Library        OperatingSystem
Library        String

### DOCUMENTATION ###
# Verificar Library Excel, provavelmente não será usada
# Library OperatingSystem será usada no lugar da ExcelLibrary

*** Variable ***
${j}    ${0}

*** Keywords ***
Get DateTime
    ${GETDATE}                              Get Current Date        result_format=_%d-%m-%Y_[%H;%M;%S]
    [Return]                                ${GETDATE}

### EXCEL FILES
File Exists
    [Arguments]                             ${TARGET.name}           ${TARGET.attribute}
    Create File                             ${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx     ${EMPTY}     UTF-8
    File Should Exist                       ${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx
    Open Excel File                         ${TARGET.name}                ${TARGET.attribute}
    Wait Until Element Is Visible           ${FOLLOWERS-BOX}

# Create Excel to Save Attribute
#     [Arguments]                             ${TARGET.name}          ${TARGET.attribute}
#     Create Excel Document                   doc_id=${TARGET.attribute}
#     Save Excel Document                     filename=${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx

Open Excel File
    [Arguments]                             ${TARGET.name}          ${TARGET.attribute}
    Get File                                ${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx     UTF-8    strict

Add Data In Excel File
    [Arguments]                             ${TARGET.name}          ${TARGET.attribute}         ${FOLLOW.user}
    Append To File                          ${CURDIR}/data/${TARGET.name}-${TARGET.attribute}.xlsx      content=${FOLLOW.user}${\n}     UTF-8

### SCREENSHOTS FILES
Screenshot
    [Arguments]                             ${filename}     ${dir}         
    ${DATE}                                 Get DateTime
    Set Local Variable                      ${Path}         ${CURDIR}/captures/${dir}
    Set Screenshot Directory                ${Path}         
    Capture Page Screenshot                 ${filename}${DATE}.png