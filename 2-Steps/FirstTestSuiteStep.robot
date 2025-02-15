*** Settings ***
Library     SeleniumLibrary

Resource    ../3-pages/FirstTestSuitePage.robot

*** Keywords ***

Fill field
    [Arguments]    ${element}    ${text}
    Wait Until Element Is Visible            ${element}            10s
    Click Element                            ${element}
    Sleep                                    0.5s
    Input Text                               ${element}            ${text}
    Element Should Contain                   ${element}            ${text}