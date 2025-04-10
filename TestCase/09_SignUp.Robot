*** Settings ***
Resource    ../Resource/SignUp.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browser   ${URL_SignUp}     ${BROWSER}

*** Variables ***
${Message_existed_Email}     //div[contains(text(), 'Email đã tồn tại')]
${Message_SignUp_Success}  //div[contains(text(), 'Đăng ký tài khoản thành công')]
${Message_Blank_Name}    //p[contains(text(), 'Vui lòng nhập họ tên')]
${Message_Blank_Email}    //p[contains(text(), 'Vui lòng nhập email.')]
${Message_Blank_Password}    //p[contains(text(), 'Vui lòng nhập mật khẩu.')]
${Message_error_MissPassword}     //p[contains(text(), 'Vui lòng nhập mật khẩu.')]
${Button_Off_State}     //div[@style='cursor: no-drop;']
${Button_close_alert}    //button[@aria-label='close']
${TimeOut}    30s

*** Keywords ***


*** Test Cases ***
SignUp failed when entering email already exists
    [Documentation]    SignUp with email already exists
    ${SignUp_Random}    generate random string    3    1234567890
    SignUp Web Haui Food  Thaontt_${SignUp_Random}    thanhthaongo845@gmail.com  thao2702@74
    wait until element is visible    ${Message_existed_Email}    ${TimeOut}
    click element    ${Button_close_alert}
    Clear Text    ${Name_Locator}
    Clear Text     ${Email_Locator}
    Clear Text      ${Password_Locator}

SignUp failed when name field is left blank
    [Documentation]    SignUp with name blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    ${EMPTY}
    input text    ${Email_Locator}    thaontt.22@gmail.com
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_Blank_Name}    ${TimeOut}
    Clear Text    ${Email_Locator}
    Clear Text    ${Password_Locator}

SignUp failed when email field is left blank
    [Documentation]    SignUp with email blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    thaontt_23
    input text    ${Email_Locator}    ${EMPTY}
    input text    ${Password_Locator}    thao2702@
    wait until element is visible    ${Message_Blank_Email}    ${TimeOut}
    Clear Text    ${Name_Locator}
    Clear Text    ${Password_Locator}

SignUp failed when password field is left blank
    [Documentation]    SignUp with password blank
    wait until element is visible     ${Email_Locator}    ${TimeOut}
    input text    ${Name_Locator}    thaontt_23
    input text    ${Email_Locator}    thaontt.23@gmail.com
    input text    ${Password_Locator}    ${EMPTY}
    wait until element is visible    ${Message_Blank_Password}    ${TimeOut}
    Clear Text    ${Name_Locator}
    Clear Text    ${Email_Locator}

SignUp success when valid fields are entered
    [Documentation]    SignUp with valid information
    ${SignUp_Random}    generate random string    3    1234567890
    SignUp Web Haui Food  Thaontt_${SignUp_Random}    thaontt.${SignUp_Random}@gmail.com    thao2702@
    wait until element is visible    ${Message_SignUp_Success}    ${TimeOut}
    sleep    5s


