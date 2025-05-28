*** Settings ***
Resource    ../Resource/SignUp.resource
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browser   ${URL}    headlesschrome


*** Variables ***
${Message_existed_Email}     //div//div[contains(text(), 'Email đã tồn tại')]
${Message_SignUp_Success}  //div//div[contains(text(), 'Đăng ký tài khoản thành công')]
${Message_Blank_Name}    //p[contains(text(), 'Vui lòng nhập họ tên')]
${Message_Blank_Email}    //p[contains(text(), 'Vui lòng nhập email.')]
${Message_Blank_Password}    //p[contains(text(), 'Vui lòng nhập mật khẩu.')]
${Message_error_MissPassword}     //p[contains(text(), 'Vui lòng nhập mật khẩu.')]
${Button_Off_State}     //div[@style='cursor: no-drop;']
${Button_close_alert}    //div//button[@aria-label='close']
${Button_dang_ki}    //div//a[@class='SignIn_login__link__+gFvW']
${TimeOut}    30s

*** Keywords ***


*** Test Cases ***
Đăng ký không thành công khi nhập email đã tồn tại
    [Documentation]    SignUp with email already exists
    ${SignUp_Random}    generate random string    3    1234567890
    wait until element is visible    ${Button_dang_ki}    ${timeout}
    click element    ${Button_dang_ki}
    SignUp Web Haui Food  Thaontt_${SignUp_Random}    thanhthaongo845@gmail.com  thao2702@74
    wait until element is visible    ${Message_existed_Email}    ${TimeOut}
    click element    ${Button_close_alert}
    Clear Text    ${Name_Locator}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

Đăng ký không thành công khi để trống tên
    [Documentation]    SignUp with name blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    ${EMPTY}
    input text    ${Email_Locator}    thaontt.22@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_Blank_Name}    ${TimeOut}
    Clear Text    ${Email_Locator}
    Clear Text    ${Password_Locator}

Đăng kí không thành công khi để trống email
    [Documentation]    SignUp with email blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    thaontt_23
    input text    ${Email_Locator}    ${EMPTY}
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_Blank_Email}    ${TimeOut}
    Clear Text    ${Name_Locator}
    Clear Text    ${Password_Locator}

Đăng ký không thành công khi để trống password
    [Documentation]    SignUp with password blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    thaontt_23
    input text    ${Email_Locator}    thaontt.23@gmail.com
    input text    ${Password_Locator}    ${EMPTY}
    wait until element is visible    ${Message_Blank_Password}    ${TimeOut}
    Clear Text    ${Name_Locator}
    Clear Text    ${Email_Locator}

Đăng ký thành công khi nhập hơp tất cả các trường bắt buộc
    [Documentation]    SignUp with valid information
    ${SignUp_Random}    generate random string    3    1234567890
    SignUp Web Haui Food  Thaontt_${SignUp_Random}    thaontt.${SignUp_Random}@gmail.com    thao2702@
    wait until element is visible    ${Message_SignUp_Success}    ${TimeOut}
    sleep    5s


