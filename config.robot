*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${browser}        chrome

*** Keywords ***
Iniciar sessao
    Open Browser

Encerrar sessao
    Close Browser