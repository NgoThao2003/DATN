*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/ShoppingCardManagement.resource
Suite Setup    Open Browwer And Login

*** Variables ***
${Icon_Plus_Qty}     //div[@class='QuantityDrawer_quantity-drawer__quantity-plus__2ZkQD']
${Icon_minus}     //div[@class='QuantityDrawer_quantity-drawer__quantity-minus__9kyFS']
${Quantity_Product}     //div[@class='QuantityDrawer_quantity-drawer__quantity-value__LTY2O']
${Button_close_card_3}    //div[@class='quantity-drawer__header']//span
${Button_delete_all}    //button[contains(text(), 'Xóa tất cả')]
${Message_DeleteAll_Success}  //div//div[contains(text(), 'Thành công')]

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

Thêm sản phẩm với số lượng lớn hơn 1 vào giỏ hàng
    Search success with text detail    Cơm chả cá
    sleep    4s
    Thêm sản phẩm vào giỏ hàng khi thay đổi số lượng    ${Icon_Plus_Qty}    <

Kiểm tra nhấn nút "- +" khi sản phẩm có quantity bằng 1
    Search success with text detail    Cơm chả cá
    Kiểm tra icon cộng trừ    ${Icon_minus}    0
    Kiểm tra icon cộng trừ    ${Icon_Plus_Qty}    1
    click element   ${Button_close_card_3}
    sleep    2s


View cart successfully when cart has products
   sleep    5s
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
        ${status}    run keyword and return status    wait until element is visible    ${Message_card_emty}    3s
        IF    '${status}' == '${False}'
            click element    ${Button_close_card_2}
        ELSE
            click element    ${Button_close_card}
        END
        wait until element is visible    ${Message_delete_product_success}    ${TimeOut}
        log to console    Delete Product success
    END

Delete All Product in Cart
    Product Add Card
    wait until element is visible    ${Button_card}    ${timeout}
    click element    ${Button_card}
    ${status}    run keyword and return status    wait until element is visible    ${Card_product_detail}    ${TimeOut}
    IF    '${status}' == '${False}'
        click element    ${Button_close_card_2}
        skip    Your cart has not product
    ELSE
        sleep    2s
        click element    ${Button_delete_all}
        wait until element is visible    ${Message_DeleteAll_Success}
        sleep    3s
        log to console    Delete All Product in Cart Success
    END