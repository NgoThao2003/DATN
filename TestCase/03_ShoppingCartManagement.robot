*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/ShoppingCardManagement.resource
Suite Setup    Open Browwer And Login

*** Variables ***

*** Keywords ***


*** Test Cases ***
View cart successfully when cart is empty
    wait until element is visible    ${Button_card}   ${TimeOut}
    click element    ${Button_card}
    ${status}    run keyword and return status    wait until element is visible    ${Message_card_emty}    3s
    IF    '${status}' == '${False}'
        click element    ${Button_close_card_2}
        skip    Your cart has products
    ELSE
        click element    ${Button_close_card}
    END

Product added to cart successfully
    Product Add Card

View cart successfully when cart has products
   Product View Card

Delete One Product in Cart
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    ${status}    run keyword and return status    wait until element is visible    ${Button_product_delete}    ${TimeOut}
    IF    '${status}' == '${False}'
        click element    ${Button_close_card_2}
        skip    Your cart has products
    ELSE
        click element    ${Button_product_delete}
        wait until element is visible    ${Message_delete_product_success}    ${TimeOut}
        log to console    Delete Product success
    END