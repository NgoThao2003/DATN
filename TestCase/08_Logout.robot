*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login
Library    SeleniumLibrary
*** Variables ***

*** Keywords ***

*** Test Cases ***
Logout success
    wait until element is visible    ${Message_SignIn_Success}    ${TimeOut}
    click element    ${Button_close_alert}
    wait until element is visible    ${Avt}    ${TimeOut}
    click element    ${Avt}
    wait until element is visible    ${Button_Logout}     ${TimeOut}
    click element    ${Button_Logout}
    wait until element is visible    ${Message_Logout_Success}    ${TimeOut}



