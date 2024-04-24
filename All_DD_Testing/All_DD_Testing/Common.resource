*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Web_URL}                  https://www.saucedemo.com/
${Browser}                  Chrome
${Username_Textbox}         id:user-name
${Password_Textbox}         id:password
${Login_Button}             id:login-button
${Error_Messages_Path}      xpath://*[@id="login_button_container"]/div/form/div[3]/h3



*** Keywords ***
Start TestCase
    Open Browser    ${Web_URL}      ${Browser}
    Maximize Browser Window
    Sleep    2s

Finish TestCase
    Close Browser
