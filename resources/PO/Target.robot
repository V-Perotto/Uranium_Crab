*** Settings ***
Resource            ../../file.robot

*** Variables ***
### ELEMENTS
${PAGE}                     xpath=//body
${i}                        ${1}
${r}                        ${0}
${COUNT-Soldier}            ${0}
${COUNT-Infantry}           ${0}
${SOLDIER}                  Followers
${INFANTRY}                 Followings
# user
${TEXT_USER}                xpath=//h2[contains(text(), "${TARGET}")]
# publications
${NUM_PUBLICATIONS}         xpath=//ul/li/span/span[@class="g47SY "]
                                  ##   1º div[x] = Logo Instagram [2] ou Posts [1]
                                  ##   2° div[x] = Coluna de Post (Vai até o final da página, ou melhor, dos posts da coluna)
                                  ##   3º div[x] = Linha de Post  (ou seja, vai até 3)
${POST_PHOTO}               xpath=//div[1]/div/div[1]/div[1]/a/div/div[1]/img[@src]
# blablabla
${POST_LINK}                xpath=//img[starts-with(@src, 'https://instagram.fbfh4-1.fna.fbcdn.net/v/t51.2885-15')]
${CLOSE_POST}               xpath=(//div[@class="                     Igw0E     IwRSH      eGOV_         _4EzTm                                                                                  BI4qX            qJPeX            fm1AK   TxciK yiMZG"]/button[@class="wpO6b "]/div[@class="QBdPU "])
${NEXT_POST}                xpath=(//a[@class=" _65Bje  coreSpriteRightPaginationArrow"])
${BTN-NEXT_POST}            xpath=(//button[@class="  _6CZji   "])
${BANNER}                   xpath=//article[@class="M9sTE  L_LMM  JyscU Tgarh ePUX4"]
# followers
${FOLLOWERS}                xpath=//ul/li/a/span[@title]
${FOLLOWERS-BOX}            xpath=//div[@class="_1XyCr"]
${LINK_FOLLOWERS}           xpath=//ul/li[@class="Y8-fY "][2]
${LINK-COLUMN}              xpath=//ul/div/li[${i}]/div/div[2]/div[1]/div/div/span/a
${COLUMN-BODY}              xpath=//div[@class="isgrP"]
${CLOSE_BTN}                xpath=//div[1]/div/div[2]/button[@class="wpO6b "]
# followings
${FOLLOWINGS}               xpath=//li[3]/a/span
${LINK_FOLLOWINGS}          xpath=//ul/li[@class="Y8-fY "][3]
# tagged
${TAGGED}                   xpath=//a[@class="_9VEo1 "]
# publications
${PUBLICATIONS}             xpath=//a[@class="_9VEo1 T-jvg"]

### HIGHLIGHTS (HL) - preciso fazer percorrer para o robô anotar a quantia de highlights
### pra isso, ele vai precisar fazer com que exista um contador de highlights
### Ou eu faço ele contar sempre o primeiro, para salvar informações do primeiro se ele for diferente
### isso poderia poupar de criar um contador, porém seriam menos dados captados

## <time class="BPyeS Nzb55" datetime="2020-05-27T12:21:24.000Z" title="27 de maio de 2020">28 sem</time>
## fazer um contador de title, onde ele pega o valor, tira print, se o proximo for diferente, 
## ele pega o valor, se o valor for igual, ele tira print, ele faz isso até o //time desaparecer

## Para cada Page Down, posso visualizar 6 contas, caso uma conta tenha 314 seguidores, por exemplo, 
## eu tive que usar 52 cliques no Page Down, precisarei fazer uma conta para saber o quando devo clicar 
## até aparecerem todos, ou quando parar de descer.
## Exemplo, ler e gravar 6 contas, clicar no Page Down e repetir o processo.

# salvar link de imagem
${HL_1}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][1]
${HL_2}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][2]/div/div/div/div[@class="tUtVM"]/img

*** Keywords ***
User Is Visible
    Wait Until Element Is Visible               ${TEXT_USER}
    Wait Until Element Is Visible               ${H2_USER}
    Sleep   1

Jump Page
    FOR         ${i}       IN RANGE             3
        Press Keys         ${PAGE}              \ue00f  # PAGE DOWN
    END

# Scroll Page To Location
#     [Arguments]    ${x_location}    ${y_location}
#     Execute JavaScript    window.scrollTo(${x_location}, ${y_location})

Page Down
    Press Keys             ${COLUMN-BODY}       \ue00f  # PAGE DOWN    

# Count
Count Army
    [Arguments]            ${COUNT.attribute}
    FOR         ${j}       IN RANGE             1                ${COUNT.attribute} + 1
        Page Down    
        Sleep              2
    END

Get Army
    [Arguments]            ${attribute}         ${num_attribute}      ${army}
    FOR         ${i}       IN RANGE             1                ${num_attribute} + 1
        Wait Until Element Is Visible           ${role}
        ${role-user}       Get Text             ${LINK-COLUMN}
        Add Data In Excel File                  ${target}        ${attribute}    ${role-user}
        ${r}=              Evaluate             ${r} + 1
        Sleep              1
    END

Save Profile Status
    User Is Visible
    ${USER_INSTA}          Get Text             ${TEXT_USER}
    Screenshot             ${USER_INSTA}        profile
    ${POST}                Get Element Count    ${POST_LINK}

Capture Followers
    [Arguments]            ${SOLDIER.army}      ${ATTRIBUTE.soldier}
    # Followers conversion
    ${NUM_FOLLOWERS}       Get Text             ${SOLDIER.army}
    ${NUM_FOLLOWERS}       Remove String        ${NUM_FOLLOWERS}        .
    # Transforming to Integer for Page Down uses
    ${COUNT-Soldier}=      Evaluate             ${NUM_FOLLOWERS} / 6
    ${COUNT-Soldier}       Convert To Number    ${COUNT-Soldier}        0
    ${COUNT-Soldier}       Convert To Integer   ${COUNT-Soldier}
    Click Element          ${SOLDIER.army}
    Wait Until Element Is Visible               ${LINK-COLUMN}
    Wait Until Element Is Visible               ${COLUMN-BODY}
    Click Element          ${COLUMN-BODY}
    Count Army             ${COUNT-Soldier}
    Log                    ${COUNT-Soldier}
    Get Army               ${COUNT-Soldier}     ${NUM_FOLLOWERS}    ${SOLDIERS}
    Click Element          ${CLOSE_BTN}

Capture Followings
    [Arguments]            ${INFANTRY.army}     ${ATTRIBUTE.infantry}
    # Followings conversion
    ${NUM_FOLLOWINGS}      Get Text             ${INFANTRY.army}
    ${NUM_FOLLOWINGS}      Remove String        ${NUM_FOLLOWINGS}       .
    # Transforming to Integer for Page Down uses
    ${COUNT-Infantry}=     Evaluate             ${NUM_FOLLOWINGS} / 6
    ${COUNT-Infantry}      Convert To Number    ${COUNT-Infantry}       0
    ${COUNT-Infantry}      Convert To Integer   ${COUNT-Infantry}
    Click Element          ${INFANTRY.army}
    Wait Until Element Is Visible               ${LINK-COLUMN}
    Click Element          ${COLUMN-BODY}
    Count Army             ${COUNT-Infantry}
    Get Army               ${INFANTRY.army}     ${NUM_FOLLOWINGS}    ${TARGET}
    Click Element          ${CLOSE_BTN}       

Save Attribute
    Capture Followers      ${FOLLOWERS}         ${SOLDIER}
    # Capture Followings     ${FOLLOWINGS}        ${INFANTRY}
    File Exists            ${TARGET}            ${ATTRIBUTE.soldier}    # Write All follow/er/ing users to Excel File. This time is to get followers only

# Catch All Posts
#     ${NUM_PUBLICATIONS}    Get Text         ${QNTD_PUBLICATIONS}
#     Jump Page
#     FOR      ${i}          IN RANGE         1         ${NUM_PUBLICATIONS+1}
#         Wait Until Element Is Visible       ${BANNER}
#         Sleep                               1
#         Postshot                            post${i}
#         Run Keyword If                      Page Should Contain Element    ${BTN-NEXT_POST}
#         ELSE IF                             Click Element      ${NEXT_POST}
#     END
#     Click Element      ${CLOSE_POST}