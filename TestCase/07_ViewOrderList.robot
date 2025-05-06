*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login

*** Variables ***


*** Keywords ***

*** Test Cases ***
View a list of successful orders when users have purchased
    wait until element is visible     ${Button_close_alert}
    click element    ${Button_close_alert}
    Go to Account information
    wait until element is visible  ${Button_Đơn_Hang}    ${timeout}
    sleep    2s
    click element   ${Button_Đơn_Hang}
    wait until element is visible    ${DonMua_Status_HoanThanh}    15s
    click element    ${DonMua_Status_HoanThanh}
    ${status}    run keyword and return status    wait until element is visible    ${List_DonHang}    ${TimeOut}
    IF    '${status}' == '${True}'
        log to console   Pass case View a list of successful orders when users have purchased
    ELSE
        skip    User chưa có đơn nào mua hàng thành công
    END
