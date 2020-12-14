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
# salvar link de imagem
${HL_1}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][1]/div/div/div/div[@class="tUtVM"]/img
${HL_2}                     xpath=//ul[@class="vi798"]/li[@class="Ckrof"][2]/div/div/div/div[@class="tUtVM"]/img

${PUBLICATIONS}             xpath=//a[@class="_9VEo1 T-jvg"]
${TAGGED}                   xpath=//a[@class="_9VEo1 "]

*** Keywords ***
