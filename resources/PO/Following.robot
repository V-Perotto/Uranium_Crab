*** Settings ***
Library             ExcelLibrary

*** Variables ***
### ELEMENTS
${TEXT_USER}                xpath=//h2[contains(text(), "arianyrahini")]
${LINK_PUBLICATIONS}        xpath=//ul/li[@class="Y8-fY "][1]
${LINK_FOLLOWERS}           xpath=//ul/li[@class="Y8-fY "][2]
${LINK_FOLLOWINGS}          xpath=//ul/li[@class="Y8-fY "][3]

### HIGHLIGHTS (HL) - preciso fazer percorrer para o robô anotar a quantia de highlights
### pra isso, ele vai precisar fazer com que exista um contador de highlights
### Ou eu faço ele contar sempre o primeiro, para salvar informações do primeiro se ele for diferente
### isso poderia poupar de criar um contador, porém seriam menos dados captados

## <time class="BPyeS Nzb55" datetime="2020-05-27T12:21:24.000Z" title="27 de maio de 2020">28 sem</time>
## fazer um contador de title, onde ele pega o valor, tira print, se o proximo for diferente, 
## ele pega o valor, se o valor for igual, ele tira print, ele faz isso até o //time desaparecer

# salvar link de imagem
${HL_1}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][1]
### ${HL_2}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][2]/div/div/div/div[@class="tUtVM"]/img

${PUBLICATIONS}             xpath=//a[@class="_9VEo1 T-jvg"]
${TAGGED}                   xpath=//a[@class="_9VEo1 "]

*** Keywords ***
User Is Visible
    Wait Until Element Is Visible       ${TEXT_USER}

Save Image
    Capture Page Screenshot

Save Highlights
    User Is Visible
    Click Element           ${HL_1}
    Screenshot              ariany
