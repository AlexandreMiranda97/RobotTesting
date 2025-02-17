*** Settings ***
Library     SeleniumLibrary

Resource    ../3-pages/FirstTestSuitePage.robot

*** Keywords ***

Preencher campo
    [Arguments]    ${elemento}    ${valor}
    Wait Until Element Is Visible            ${elemento}                   10
    Click Element                            ${elemento}
    Wait Until Element Is Enabled            ${elemento}                   10
    Sleep                                    0.3
    Input Text                               ${elemento}                   ${valor}
    Element Should Contain                   ${elemento}                   ${valor}

Clicar elemento
    [Arguments]    ${elemento}    ${timeout}=10
    Wait Until Element Is Visible            ${elemento}                   ${timeout}
    Click Element                            ${elemento}
    Sleep                                    1

Acessar a pagina
    [Arguments]    ${URL}
    Open Browser                             ${URL}                        chrome

Realizar login
    [Arguments]    ${usuario}    ${senha}
    Wait Until Element Is Visible            ${inputUsername}              10s
    Preencher campo                          ${inputUsername}              ${usuario}
    Element Should Contain                   ${inputUsername}              ${usuario}
    Sleep                                    1
    Preencher campo                          ${inputPassword}              ${senha}
    Element Should Contain                   ${inputPassword}              ${senha}
    Sleep                                    1
    Clicar elemento                          ${loginButton}