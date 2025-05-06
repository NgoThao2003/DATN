*** Settings ***
Resource   Library.resource
Resource    Utils.resource
Resource    Search.resource


*** Variables ***
${Input_Search}    //div[@class='Banner_banner__search-container__V9pTi']//input
${Button_Search}    //button[contains(text(), 'Tìm kiếm')]
${List_Name_Product}    //div[@class='col-xl-4 col-12']//div[2]//div[@class='ProductCard_product__name__6llVj']
${Message_error_search}    //div[@class='NoResult_no-result__content__y3KQf']//h3
${Icon_search}    //*[name()='svg' and @class='Banner_search-icon__k9VXG']
${Button_close_alert}    //div//button[@aria-label='close']
*** Keywords ***
Product Add Card
    Search success with text detail    Cơm heo quay
    scroll element into view    ${Plus_icon}
    wait until element is visible    ${Plus_icon}    ${timeout}
    click element    ${Plus_icon}
    wait until element is visible    ${Button_Add_To_Card}     ${timeout}
    click element    ${Button_Add_To_Card}
    wait until element is visible    ${Message_Add_cart_success}    ${TimeOut}
    wait until element is visible    ${Button_close_alert}
    click element    ${Button_close_alert}
    sleep    3s

Product View Card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    ${status}    run keyword and return status    wait until element is visible    ${Card_product_detail}    ${TimeOut}
    IF    '${status}' == '${False}'
        click element    ${Button_close_card_2}
        wait until element is visible    ${Button_card}
        skip    Your cart has products
    ELSE
        click element    ${Button_close_card_2}
        wait until element is visible    ${Button_card}
        log to console    View cart successfully when cart has products Pass
    END

Thêm sản phẩm vào giỏ hàng khi thay đổi số lượng
    [Arguments]    ${Button_change_qty}    ${Toan_tu_ss}
    scroll element into view    ${Plus_icon}
    wait until element is visible    ${Plus_icon}    ${timeout}
    click element    ${Plus_icon}
    wait until element is visible    ${Button_Add_To_Card}     ${timeout}
    ${Quantity}    get text    ${Quantity_Product}
    ${Quantity}    Evaluate    int(${Quantity})
    click element    ${Button_change_qty}
    ${Quantity_change}    get text    ${Quantity_Product}
    ${Quantity_change}    Evaluate    int(${Quantity_change})
    ${is_less}    Evaluate    ${Quantity}${Toan_tu_ss}${Quantity_change}
    Should Be True    ${is_less}
    click element    ${Button_Add_To_Card}
    wait until element is visible    ${Message_Add_cart_success}    ${TimeOut}
    wait until element is visible    ${Button_close_alert}
    click element    ${Button_close_alert}
    sleep    2s

Kiểm tra icon cộng trừ
    [Arguments]    ${Button_change_qty_2}    ${Number}
    scroll element into view    ${Plus_icon}
    wait until element is visible    ${Plus_icon}    ${timeout}
    click element    ${Plus_icon}
    wait until element is visible    ${Button_Add_To_Card}     ${timeout}
    click element    ${Button_change_qty_2}
    ${Quantity_change}    get text    ${Quantity_Product}
    ${status}    run keyword and return status    should be equal    ${Number}    ${Quantity_change}
    IF    '${status}' == '${True}'
        log to console    Icon vẫn hoạt động bình thường
    ELSE
        fail    Icon không hoạt động
    END