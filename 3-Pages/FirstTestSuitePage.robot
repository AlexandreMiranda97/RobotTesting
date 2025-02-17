*** Variables ***

${SwagLabsTitle}                    xpath=//div[contains(text(), "Swag Labs")]
${inputUsername}                    xpath=//input[@id="user-name"]
${inputPassword}                    xpath=//input[@id="password"]
${loginButton}                      xpath=//input[@id="login-button"]
${userErroMsg}                      xpath=//*[contains(text(), "Epic sadface: Username is required")]