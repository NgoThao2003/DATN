*** Settings ***
Resource   Library.resource

*** Variables ***
${BROWSER}   chrome
${URL}  https://hauifood.com/auth/login
${Email_Locator}    //input[@type='email']
${Password_Locator}    //input[@type='password']
${Button_SignUp}    (//button)[1]

*** Keywords ***
Login Web Haui Food
    [Arguments]    ${Email}    ${Password}
#    Open Browser   ${URL}    ${BROWSER}
    maximize browser window
    Execute JavaScript    document.body.style.zoom = '0.8';
    wait until element is visible     ${Email_Locator}    60s
    input text    ${Email_Locator}   ${Email}
    input text    ${Password_Locator}    ${Password}
    click button    ${Button_SignUp}

Open Browwer And Login
   Open Browser   ${URL}    ${BROWSER}
   Login Web Haui Food    thanhthaongo845@gmail.com    thao2702@
