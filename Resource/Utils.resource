*** Settings ***
Resource    Library.resource

*** Variables ***
${TimeOut}    30s
#ShoppingCardManager
${Button_card}   (//span[@class='Button_icon__Zd50D'])[1]
${Message_card_emty}    //div[@class='Cart_cart__empty__-foLH']
${Button_close_card}    //button[@class='Cart_cart__close__nToPe']
${Button_products_delete_all}    //button[@class='Cart_cart__products-delete-all__-ZJQU']
${Button_product_delete}    //button[@class='CartItem_product__detail-delete__RSeZn']
${Plus_icon}    //div[@class='ProductCard_product__add-cart-btn__Ze7Gs']
${Button_Add_To_Card}    //button[@class='Button_wrapper__GqKsN QuantityDrawer_quantity-drawer__add-btn__a7VEh Button_primary__9MLUH']
${Message_Add_cart_success}    //div[contains(text(), 'Thêm sản phẩm vào giỏ hàng thành công')]
${Message_delete_product_success}    //div[contains(text(), 'Xóa sản phẩm khỏi giỏ hàng thành công')]
${Button_close_card_2}    //button[@class='Cart_cart__close__nToPe']//*[name()='svg']
${Card_product_detail}    //div[@class='CartItem_product__detail__1zuxV']

#Logout
${Message_SignIn_Success}  //div[contains(text(), 'Đăng nhập thành công')]
${Avt}   (//div[@class='Header_header__actions-group__uAY5S'])[1]
${Button_Logout}    //div[@class='Header_header__actions-group__uAY5S']//ul/li
${Message_Logout_Success}  //div[contains(text(), 'Đăng xuất thành công')]
${Button_close_alert}    //button[@aria-label='close']

#ViewAccountInformation
${Button_Personal Page}    //div[@class='Header_header__actions-group__uAY5S']//ul/a
${Input_HoTen}    //input[@placeholder='Họ tên']
${Input_Email}    //input[@placeholder='Email']
${Button_close_alert}    //button[@aria-label='close']
*** Keywords ***
Clear Text
    [Arguments]    ${Clear_element}
    Click Element    ${Clear_element}
    Press Keys    ${Clear_element}    CTRL+a    BACKSPACE

Go to Account information
    wait until element is visible    ${Avt}    ${timeout}
    sleep    3s
    click element    ${Avt}
    wait until element is visible    ${Button_Personal Page}    ${TimeOut}
    click element    ${Button_Personal Page}