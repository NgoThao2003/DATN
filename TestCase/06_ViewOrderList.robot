*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Button_Personal Page}    //div[@class='Header_header__actions-group__uAY5S']//ul/a
${Button_close_alert}    //button[@aria-label='close']
${Button_DonMua}    (//button//p[contains(text(), 'Đơn mua')])[2]
${DonMua_Status_HoanThanh}    //div[@class='HistoryOder_order-status__nav__KF42a']//div[contains(text(), 'Hoàn thành')]
${List_DonHang}    //div[@class='list-item']//div[@class='HistoryOderItem_item-wrapper__Vu-3M']
*** Keywords ***
Check input have value
    [Arguments]    ${Input}
    ${value}=    Get Value    ${Input}
    Should Not Be Empty    ${value}

*** Test Cases ***
View a list of successful orders when users have purchased
    wait until element is visible     ${Button_close_alert}
    click element    ${Button_close_alert}
    Go to Account information
    wait until element is visible  ${Button_DonMua}     ${timeout}
    click element    ${Button_DonMua}
    wait until element is visible    ${DonMua_Status_HoanThanh}    ${timeout}
    click element    ${DonMua_Status_HoanThanh}
    sleep    3s
    ${status}    run keyword and return status    wait until element is visible    ${List_DonHang}    ${TimeOut}
    IF    '${status}' == '${True}'
        log to console   Pass case View a list of successful orders when users have purchased
    ELSE
        skip    User chưa có đơn nào mua hàng thành công
    END

