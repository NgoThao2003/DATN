*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Button_chinh_sua}    //button[@class='Button_wrapper__6uHX0 Button_primary__CHwmz']//p
${Message_Edit_AC_Success}     //div//div[contains(text(), 'Cập nhật thành công.')]
${Message_name_required}    //div[contains(text(), 'Vui lòng nhập đầy đủ họ tên.')]
${Toast_Message_Phone_Require}    //div//div[contains(text(), 'property.phone có ít nhất 10 ký tự')]
${Message_phone_fail}    //div[contains(text(), 'Số điện thoại không hợp lệ.')]
${Button_Huy}    //button[@class='Button_wrapper__6uHX0 Button_primary__CHwmz Button_cancel__M6zS9']
*** Keywords ***

Input Account Information
    [Arguments]    ${Name}    ${Phone}
    wait until element is visible    ${Button_chinh_sua}    ${TimeOut}
    click element    ${Button_chinh_sua}
    clear text    ${Input_HoTen}
    clear text    ${Input_sđt}
    input text    ${Input_HoTen}    ${Name}
    input text    ${Input_sđt}    ${Phone}


*** Test Cases ***
Kiểm tra nhập thông tin các trường hợp lệ
    wait until element is visible     ${Button_close_alert}
    click element    ${Button_close_alert}
    Go to Account information
    Input Account Information    Linhdt    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}
    Input Account Information    Thaontt    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}

Kiểm tra không nhập tên
    Input Account Information    ${EMPTY}    0977151842
    wait until element is visible    ${Message_name_required}

Kiểm tra nhập tên toàn khoảng trắng
    Input Account Information    ${SPACE*5}    0977151842
    wait until element is visible    ${Message_name_required}

Kiểm tra tên có chứa ký tự đặc biệt, chữ và số
    Input Account Information    Thaontt123@    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}

Kiểm tra nhập tên < 50 ký tự
    sleep    3s
    Input Account Information    NgoThiThanhThao    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}

Kiểm tra nhập tên = 50 ký tự
    Input Account Information    NgoThiThanhThaoNgoThiThanhThaoNgoThiThanhThaoNgoTh    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}

Kiểm tra không nhập số điện thoại
    Input Account Information      NgoThiThanhThao    ${EMPTY}
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Toast_Message_Phone_Require}
    click element    ${Button_close_alert}

Kiểm tra nhập số điện thoại có chứa ký tự chữ
    clear text    ${Input_HoTen}
    clear text    ${Input_sđt}
    input text    ${Input_HoTen}     NgoThiThanhThao
    input text    ${Input_sđt}   0thaothaoo
    wait until element is visible    ${Message_phone_fail}


Kiểm tra nhập số điện thoại có chứa ký tự đặc biệt
    Input Account Information    NgoThiThanhThao    0955!#$%^&
    wait until element is visible    ${Message_phone_fail}

Kiểm tra nhập số điện thoại < 10 số
    Input Account Information    NgoThiThanhThao    097734521
    click element    ${Button_Cap_Nhat}
    click element    ${Button_close_alert}
    wait until element is visible    ${Message_phone_fail}

Kiểm tra nhập số điện thoại = 10 số
    sleep    3s
    Input Account Information    NgoThiThanhThao    0977452314
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}

Kiểm tra nhập số điện thoại > 10 số
    sleep    2s
    Input Account Information    NgoThiThanhThao    09773452176575684
    click element    ${Button_close_alert}
    wait until element is visible    ${Message_phone_fail}
    Input Account Information    Thaontt    0977151842
    click element    ${Button_Cap_Nhat}
    wait until element is visible    ${Message_Edit_AC_Success}