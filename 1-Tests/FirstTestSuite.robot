*** Settings ***
Library             SeleniumLibrary

Resource            ../2-Steps/FirstTestSuiteStep.robot

*** Test Cases ***
@Before
    Open Browser    url=https://www.saucedemo.com    browser=chrome

Scenario 01: FirstTestCase
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

