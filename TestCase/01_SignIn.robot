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
Đăng nhập không thành công khi nhập sai email
    [Documentation]    Đăng nhập với email sai
    Login Web Haui Food  thaontt453@gmail.com  thao2702@
    click button    ${Button_SignIn}
    wait until element is visible    ${Message_Error_SignIn}    ${TimeOut}
#    click element    ${Button_close_alert}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập sai password
    [Documentation]    Đăng nhập với password sai
    Login Web Haui Food  thanhthaongo845@gmail.com  thao27076@@
    click button    ${Button_SignIn}
    wait until element is visible    ${Message_Error_SignIn}    5s
    click element    ${Button_close_alert}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi để trống email
    [Documentation]    Đăng nhập để trống email
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    ${EMPTY}
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text    ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu @
    [Documentation]    Đăng nhập với email thiếu @
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaonttgmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu tên
    [Documentation]    Đăng nhập với email thiếu tên
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    @gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email duplicate @
    [Documentation]    Đăng nhập với email duplicate @
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu domain
    [Documentation]    Đăng nhập với email thiếu domain
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu domain header
    [Documentation]     Đăng nhập với email thiếu domain header
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@
    input text    ${Password_Locator}    thao2702@com
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu phần cuối domain
    [Documentation]    Đăng nhập với email thiếu phần cuối domain
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thao2702@gmail
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email chứa kí tự đặc biệt
    [Documentation]    Đăng nhập với email chứa kí tự đặc biệt
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt#$@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email thiếu dấu chấm
    [Documentation]    Đăng nhập với email thiếu dấu chấm
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@gmailcom
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi nhập email duplicate dot
    [Documentation]    Đăng nhập với email duplicate dot
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}    thaontt@gmail..com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_error_MissEmail}    3s
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng nhập không thành công khi để trống password
    [Documentation]    Đăng nhập với password trống
    wait until element is visible     ${Email_Locator}    3s
    input text    ${Email_Locator}  thanhthaongo845@gmail.com
    input text    ${Password_Locator}    ${EMPTY}
    wait until element is visible    ${Message_error_MissPassword}    3s
    Clear Text     ${Email_Locator}

Đăng nhập thành công khi nhập thông tin hợp lệ
    [Documentation]    Đăng nhập với thông tin hợp lệ
    Login Web Haui Food  thaontt@gmail.com  Thao2702@
    wait until element is visible    ${Message_SignIn_Success}    3s
    sleep    5s