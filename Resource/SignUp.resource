*** Settings ***
Resource   Library.resource

*** Variables ***
${BROWSER}   chrome
${URL_SignUp}  https://hauifood.com/auth/signup
${Email_Locator}    //input[@type='email']
${Password_Locator}    //input[@type='password']
${Name_Locator}    //input[@placeholder='Họ tên']
${Button_SignUp}    (//button)[1]

*** Keywords ***
SignUp Web Haui Food
    [Arguments]    ${Name}    ${Email}    ${Password}
    maximize browser window
    Execute JavaScript    document.body.style.zoom = '0.8';
    wait until element is visible     ${Email_Locator}    60s
    input text    ${Name_Locator}    ${Name}
    input text    ${Email_Locator}   ${Email}
    input text    ${Password_Locator}    ${Password}
    click button    ${Button_SignUp}

Open Browwer And SignUp
   Open Browser   ${URL}    ${BROWSER}
   SignUp Web Haui Food   thanhthaongo845@gmail.com    thao2702@
