*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Web_URL}                  https://www.amazon.com/
${Browser}                  Firefox    #Chrome
${Username_Textbox}         id:user-name
${Password_Textbox}         id:password
${Login_Button}             id:login-button
${Error_Messages_Path}      xpath://*[@id="login_button_container"]/div/form/div[3]/h3



*** Keywords ***
I open the amazaon website
    Open Browser    ${Web_URL}      ${Browser}
    Maximize Browser Window
    Sleep    2s
    Click Element    id:twotabsearchtextbox
    Input Text    twotabsearchtextbox    TP-Link N450 WiFi Router - Wireless Internet Router for Home (TL-WR940N)
    Click Element    id:nav-search-submit-button
    Sleep    4s
    Click Element    xpath:/html/body/div[1]/div[1]/div[1]/div[1]/div/span[1]/div[1]/div[3]/div/div/span/div/div/div/div[2]/div/div/div[1]/h2/a/span
    #Click Element    id:abb_accessory_add_button_B09D8X8VSV-announce
    #Click Element    xpath:/html/body/div[1]/div/div[10]/div[5]/div[1]/div[7]/div/div[1]/div/div/div/div[2]/div/div/div[2]/span[1]/span/span/input
    Click Element    id:add-to-cart-button

    Click Element    xpath://*[@id="sw-gtc"]/span/a
    #Click Element    xpath://*[@id="ewc-compact-actions-container"]/div/div[2]/span/span/a
    Sleep    3s


*** Test Cases ***
TC 1 open the amazon website
    Given I open the amazaon website