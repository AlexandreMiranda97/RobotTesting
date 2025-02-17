*** Variables ***

### Inputs ###
${SwagLabsTitle}                    xpath=//div[contains(text(), "Swag Labs")]
${inputUsername}                    xpath=//input[@id="user-name"]
${inputPassword}                    xpath=//input[@id="password"]
${inputFName}                       xpath=//input[@id="first-name"]
${inputLName}                       xpath=//input[@id="last-name"]
${inputZipCode}                     xpath=//input[@id="postal-code"]
### Buttons ###
${loginButton}                      xpath=//input[@id="login-button"]
${addBackpack}                      xpath=//div[@id="add-to-cart-sauce-labs-backpack"]
${rmBackpack}                       xpath=//div[@id="remove-sauce-labs-backpack"]
${shoppingCart}                     xpath=//div[@id="shopping_cart_container"]
${btnCheckout}                      xpath=//button[@id="checkout"]
${btnContinue}                      xpath=//input[@id="continue"]
${btnFinish}                        xpath=//button[@id="finish"]
### Messages ###
${userErrorMsg}                     xpath=//*[contains(text(), "Epic sadface: Username is required")]
${credentialErrorMsg}               xpath=//*[contains(text(), "Epic sadface: Username and password do not match any user in this service")]
### Cards ###
${listaProdutos}                    xpath=//div[@class="inventory_list"]
${cardProduto}                      xpath=//div[@class="inventory_item"]
${cartScreen}                       xpath=//div[@id="cart_contents_container"]
### Icons ###
${shopCartIcon}                     xpath=//div[@id="shopping_cart_container"]