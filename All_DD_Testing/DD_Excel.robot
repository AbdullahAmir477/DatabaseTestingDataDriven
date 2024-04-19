*** Settings ***
Library     SeleniumLibrary
Resource    Common.resource
Library     DataDriver  ..\\All_DD_Testing\\TestData.xlsx       sheet_name=Sheet1

Suite Setup     Common.Start TestCase
Suite Teardown  Common.Finish TestCase
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify the Login Fails with Invalid Credentials     ${username}     ${password}     ${error_message}
#Verify the Login Fails with Invalid Credentials     abdullah     hello     errormsg


*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}     ${error_message}
    Input Text    ${Username_Textbox}    ${username}
    Input Text    ${Password_Textbox}    ${password}
    Click Button    ${Login_Button}
    Sleep    3s
    Element Should Contain    ${Error_Messages_Path}    ${error_message}

