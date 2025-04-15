*** Settings ***
Resource   Library.resource

*** Variables ***
${BROWSER}   chrome
${URL}  https://hauifood.vn/auth/login
${Email_Locator}   //div//input[@type='email']
${Password_Locator}     //div//input[@type='password']
${Button_SignIn}    (//div//button)[1]

*** Keywords ***
Login Web Haui Food
    [Arguments]    ${Email}    ${Password}
#    Open Browser   ${URL}    ${BROWSER}
    maximize browser window
    Execute JavaScript    document.body.style.zoom = '0.8';
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}   ${Email}
    input text    ${Password_Locator}    ${Password}
    click button    ${Button_SignIn}

Open Browwer And Login
   Open Browser   ${URL}    ${BROWSER}
   Login Web Haui Food    thaontt@gmail.com    thao2702@
