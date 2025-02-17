*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${browser}=            chrome
${OPTIONS}=            add_argument("--disable-dev-shm-usage"); add_argument("--no-sandbox"); add_argument("--window-size=1920,1080"); add_argument("--start-maximized"); add_argument("--start-fullscreen");

*** Keywords ***
Iniciar sessao
    [Arguments]    ${URL}
    Open Browser            ${URL}            ${browser}            options=${OPTIONS}

Encerrar sessao
    Close Browser