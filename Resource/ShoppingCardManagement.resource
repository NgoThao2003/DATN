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

*** Keywords ***
Product Add Card
    Search success with text detail
    scroll element into view    ${Plus_icon}
    wait until element is visible    ${Plus_icon}    ${timeout}
    click element    ${Plus_icon}
    wait until element is visible    ${Button_Add_To_Card}     ${timeout}
    click element    ${Button_Add_To_Card}
    wait until element is visible    ${Message_Add_cart_success}    ${TimeOut}
    sleep    3s

Product View Card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    ${status}    run keyword and return status    wait until element is visible    ${Card_product_detail}    ${TimeOut}
    IF    '${status}' == '${False}'
        click element    ${Button_close_card_2}
        skip    Your cart has products
    ELSE
        click element    ${Button_close_card_2}
        log to console    View cart successfully when cart has products Pass
    END


