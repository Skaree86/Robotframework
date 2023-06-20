*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
connexion au site avec succes
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Location Should Be    https://www.saucedemo.com/inventory.html

connexion au site avec mdp seulement
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Element Text Should Be    class:error-message-container    Epic sadface: Username is required

connexion au site avec login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Click Button    id:login-button
    Element Text Should Be    class:error-message-container    Epic sadface: Password is required

connexion au site utilisateur bloqué
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    locked_out_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Element Text Should Be    class:error-message-container    Epic sadface: Sorry, this user has been locked out.

Test E2E avec achat
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button
    Location Should Be    https://www.saucedemo.com/inventory.html
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Element    class:shopping_cart_link
    Location Should Be    https://www.saucedemo.com/cart.html
    Click Button    id:checkout
    Input Text    id:first-name    Jean
    Input Text    id:last-name    Valjean
    Input Text    id:postal-code    33820
    Click Button    id:continue
    Location Should Be    https://www.saucedemo.com/checkout-step-two.html
    Click Button    finish
    Location Should Be    https://www.saucedemo.com/checkout-complete.html
    Element Should Contain    id:checkout_complete_container    Thank you for your order!
