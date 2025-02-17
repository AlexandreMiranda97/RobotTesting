*** Settings ***
Library             SeleniumLibrary

Resource            ../2-Steps/FirstTestSuiteStep.robot

*** Variables ***
${pageInicial}=        https://www.saucedemo.com
${usuario}=            standard_user
${usuarioErrado}=      wrong_user
${senha}=              secret_sauce


*** Test Cases ***
CT-01: Realizar login com sucesso
    Acessar a pagina    ${pageInicial}
    Realizar login    ${usuario}    ${senha}
    Validar acesso a tela    

    Element Should Be Visible    locator
    Input Text    username    tomsmith
    Input Text    password    SuperSecretPassword!
    Click Button     class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Click Link    Logout
    Close Browser

TestCase2
    Open Browser    url=https://www.amazon.com.br/    browser=chrome
    Close Browser

