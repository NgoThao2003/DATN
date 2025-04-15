*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login
Library    SeleniumLibrary
*** Variables ***

*** Keywords ***
Check input have value
    [Arguments]    ${Input}
    ${value}=    Get Value    ${Input}
    Should Not Be Empty    ${value}

*** Test Cases ***
View account information successfully
    wait until element is visible     ${Button_close_alert}
    click element    ${Button_close_alert}
    Go to Account information
    wait until element is visible    ${Input_HoTen}
    Check input have value    ${Input_HoTen}
    Check input have value    ${Input_Email}
    sleep    3s