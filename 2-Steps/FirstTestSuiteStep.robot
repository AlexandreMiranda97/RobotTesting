robot -v 
*** Settings ***
Library             SeleniumLibrary
Library             FakerLibrary

Resource            ../3-pages/FirstTestSuitePage.robot

*** Keywords ***
Preencher campo
    [Arguments]    ${elemento}    ${valor}
    Wait Until Element Is Visible            ${elemento}                   5
    Click Element                            ${elemento}
    Wait Until Element Is Enabled            ${elemento}                   5
    Sleep                                    0.3
    Input Text                               ${elemento}                   ${valor}
    Sleep                                    1
    FOR    ${i}    IN RANGE    1    11
        ${value}    Get Element Attribute    ${elemento}                   value
        Exit For Loop If    "${value}" == "${valor}"
        Log                                  *** Campo preenchido errado. Refazendo operação! ***
        Clear Element Text                   ${elemento}
        Input Text                           ${elemento}                   ${valor}
    END

Clicar elemento
    [Arguments]    ${elemento}    ${timeout}=5
    Wait Until Element Is Visible            ${elemento}                   ${timeout}
    Click Element                            ${elemento}
    Sleep                                    1

Realizar login
    [Arguments]    ${usuario}    ${senha}
    Wait Until Element Is Visible            ${inputUsername}              5
    Preencher campo                          ${inputUsername}              ${usuario}
    Sleep                                    0.3
    Wait Until Element Is Visible            ${inputPassword}              5
    Preencher campo                          ${inputPassword}              ${senha}
    Sleep                                    0.3
    Clicar elemento                          ${loginButton}

Validar acesso a tela pelo titulo
    [Arguments]    ${titulo}
    ${tela}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[contains(text(), "${titulo}")]   10s
    IF    "${tela}" != "True"
        Log                                  ***Tela esperada não exibida com sucesso. Teste falhou!***
        Fail
    ELSE
        Log                                  ***Elemento esperado exibido com sucesso. A tela foi carregada!***
    END

Validar produtos retornados
    Wait Until Element Is Visible            ${listaProdutos}              5
    ${count}        Get Element Count        ${cardProduto}
    Should Be True                           ${count} == 6

Adicionar produto ao carrinho
    [Arguments]    ${nomeProduto}
    Wait Until Element Is Visible            ${listaProdutos}              5
    Click Element                            xpath=//div[contains(text(), "${nomeProduto}")]/../../..//button
    Element Should Contain                   xpath=//div[contains(text(), "${nomeProduto}")]/../../..//button    Remove

Acessar carrinho
    Wait Until Element Is Visible            ${shoppingCart}               5
    Click Element                            ${shoppingCart}
    Page Should Contain Element              ${cartScreen}

Validar produto pelo nome
    [Arguments]    ${nomeProduto}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[contains(text(), "${nomeProduto}")]
    IF    "${status}" == "True"
        Log                                  ***Element exibido com sucesso!***
    ELSE
        Log                                  ***Falha ao encontrar o produto!***
        Fail
    END

Remover produto do carrinho
    [Arguments]    ${nomeProduto}
    Wait Until Element Is Visible            xpath=//div[contains(text(), "${nomeProduto}")]/../..//button[@id="remove-sauce-labs-backpack"]
    Click Button                             xpath=//div[contains(text(), "${nomeProduto}")]/../..//button[@id="remove-sauce-labs-backpack"]
    Element Should Not Be Visible            xpath=//*[contains(text(), "${nomeProduto}")]

Realizar checkout
    [Arguments]    ${nomeProduto}
    Wait Until Element Is Visible            ${btnCheckout}                5
    Click Button                             ${btnCheckout}
    Preencher dados checkout fake
    Click Button                             ${btnContinue}
    Validar acesso a tela pelo titulo        Checkout: Overview
    Validar produto pelo nome                ${nomeProduto}
    Click Button                             ${btnFinish}
    Element Should Be Visible                xpath=//*[contains(text(), "Thank you for your order!")]

Preencher dados checkout fake
    Validar acesso a tela pelo titulo        Checkout: Your Information
    ${nomeFake}=    FakerLibrary.First Name
    ${sobrenomeFake}=    FakerLibrary.Last Name
    ${zipCodeFake}=    FakerLibrary.Zipcode
    Preencher campo                          ${inputFName}                 ${nomeFake}
    Preencher campo                          ${inputLName}                 ${sobrenomeFake}
    Preencher campo                          ${inputZipCode}               ${zipCodeFake}