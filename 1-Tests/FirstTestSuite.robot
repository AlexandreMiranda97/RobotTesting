# Documentation
# Author: Alexandre Miranda da Costa
# Descrição: Execução do teste da página Sauce Demo
# 
# robot -v browser:chrome -d ./results/FirstTestSuite "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -d ./results/FirstTestSuite "1-Tests/FirstTestSuite.robot"
# 
# robot -v browser:headlesschrome -d ./results/FirstTestSuite "1-Tests/FirstTestSuite.robot"
# robot -v browser:headlessfirefox -d ./results/FirstTestSuite "1-Tests/FirstTestSuite.robot"
# 
*** Settings ***
Library                SeleniumLibrary
Library                FakerLibrary

Resource               ../2-Steps/FirstTestSuiteStep.robot
Resource               ../config.robot

Test Setup             Iniciar sessao    ${URL}
Test Teardown          Encerrar sessao

*** Variables ***
${URL}=                https://www.saucedemo.com
${usuario}=            standard_user
${usuarioNull}=
${usuarioErrado}=      wrong_user
${senha}=              secret_sauce


*** Test Cases ***
CT-01: Realizar login com sucesso
# robot -v browser:chrome -t "CT-01: Realizar login com sucesso" -d ./results/CT-01 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-01: Realizar login com sucesso" -d ./results/CT-01 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuario}    ${senha}
    Validar acesso a tela pelo titulo    Products

CT-02: Realizar login sem preencher usuario
# robot -v browser:chrome -t "CT-02: Realizar login com username errado SEM sucesso" -d ./results/CT-02 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-02: Realizar login com username errado SEM sucesso" -d ./results/CT-02 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuarioNull}    ${senha}
    Element Should Be Visible    ${userErrorMsg}

CT-03: Realizar login com usuario errado
# robot -v browser:chrome -t "CT-03: Realizar login sem preencher senha" -d ./results/CT-03 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-03: Realizar login sem preencher senha" -d ./results/CT-03 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuarioErrado}    ${senha}
    Element Should Be Visible    ${credentialErrorMsg}

CT-04: Validar quantidade de produtos
# robot -v browser:chrome -t "CT-04: Validar quantidade de produtos" -d ./results/CT-04 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-04: Validar quantidade de produtos" -d ./results/CT-04 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuario}    ${senha}
    Validar acesso a tela pelo titulo    Products
    Validar produtos retornados

CT-05: Adicionar produto ao carrinho
# robot -v browser:chrome -t "CT-05: Adicionar produto ao carrinho" -d ./results/CT-05 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-05: Adicionar produto ao carrinho" -d ./results/CT-05 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuario}    ${senha}
    Validar acesso a tela pelo titulo    Products
    Adicionar produto ao carrinho    Sauce Labs Backpack
    Acessar carrinho
    Validar produto pelo nome    Sauce Labs Backpack
    Remover produto do carrinho    Sauce Labs Backpack

CT-06: Finalizar compra
# robot -v browser:chrome -t "CT-06: Finalizar compra" -d ./results/CT-06 "1-Tests/FirstTestSuite.robot"
# robot -v browser:firefox -t "CT-06: Finalizar compra" -d ./results/CT-06 "1-Tests/FirstTestSuite.robot"
    Realizar login    ${usuario}    ${senha}
    Validar acesso a tela pelo titulo    Products
    Adicionar produto ao carrinho    Sauce Labs Backpack
    Acessar carrinho
    Validar produto pelo nome    Sauce Labs Backpack
    Realizar checkout    Sauce Labs Backpack