*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browser   ${URL}    headlesschrome


*** Variables ***
${Message_Error_SignIn}     //div//div[contains(text(), 'Tài khoản hoặc mật khẩu không chính xác')]
${Message_SignIn_Success}  //div//div[contains(text(), 'Đăng nhập thành công')]
${Message_error_MissEmail}     //p[contains(text(), 'Email không đúng, vui lòng nhập lại.')]
${Message_error_MissPassword}    //p[contains(text(), 'Mật khẩu phải chứa ít nhất 8 ký tự và 1 ký tự đặc biệt @-_')]
${Button_Off_State}     //div[@style='cursor: no-drop;']
${Button_close_alert}    //button[@aria-label='close']
${TimeOut}    30s

*** Keywords ***

*** Test Cases ***
Login failed when entering wrong email
    [Documentation]    Login with invalid email
    Login Web Haui Food  thaontt453@gmail.com  thao2702@
    click button    ${Button_SignIn}
    wait until element is visible    ${Message_Error_SignIn}    ${TimeOut}
    click element    ${Button_close_alert}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when entering wrong password
    [Documentation]    Login with invalid password
    Login Web Haui Food  thanhthaongo845@gmail.com  thao27076@@
    click button    ${Button_SignIn}
    wait until element is visible    ${Message_Error_SignIn}    5s
    click element    ${Button_close_alert}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when email field is left blank
    [Documentation]    Login with email blank
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    ${EMPTY}
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text    ${Password_Locator}

Login failed when the email is missing @
    [Documentation]    Login with email missing @
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaonttgmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when the email is missing name
    [Documentation]    Login with email missing name
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    @gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when the email is duplicate @
    [Documentation]    Login with email missing name
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when the email is missing domain
    [Documentation]    Login with email missing name
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when email is missing domain header
    [Documentation]    Login with email missing domain header
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@
    input text    ${Password_Locator}    thao2702@com
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed, email missing domain ending
    [Documentation]    Login with email missing domain ending
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@
    input text    ${Password_Locator}    thao2702@gmail
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when entering email containing special characters
    [Documentation]    Login with email contain special characters
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt#$@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when the email is missing dot
    [Documentation]    Login with email missing dot
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@gmailcom
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when the email is duplicate dot
    [Documentation]    Login with email duplicate dot
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@gmail..com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Login failed when password field is left blank
    [Documentation]    Login with password blank
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}  thanhthaongo845@gmail.com
    input text    ${Password_Locator}    ${EMPTY}
    wait until element is visible    ${Message_error_MissPassword}    3s
    Clear Text     ${Email_Locator}


Login Success when valid fields are entered
    [Documentation]    Login with valid information
    Login Web Haui Food  thaontt@gmail.com  Thao2702@
    click button    ${Button_SignIn}
    wait until element is visible    ${Message_SignIn_Success}    3s
    sleep    5s