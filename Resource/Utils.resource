*** Settings ***
Resource    Library.resource

*** Variables ***
${TimeOut}    30s
#ShoppingCardManager
${Button_card}    //div[@class='Header_header__actions-group__sLYqM Header_header__actions-cart__gm0b6']
${Message_card_emty}   //div[@class='Cart_cart__empty__ckg8T']
${Button_close_card}    //div//button[@class='Cart_cart__close__d9rmd']
${Button_products_delete_all}    //button[@class='Cart_cart__products-delete-all__-ZJQU']
${Button_product_delete}   (//button[contains(text(), 'Xóa')])[2]
${Plus_icon}     //div[@class='ProductCard_product__add-cart-btn__YSj69']
${Button_Add_To_Card}     //button[@class='Button_wrapper__6uHX0 QuantityDrawer_quantity-drawer__add-btn__DA9c1 Button_primary__CHwmz']
${Message_Add_cart_success}    //div//div[contains(text(), 'Thành công')]
${Message_delete_product_success}    //div//div[contains(text(), 'Thành công')]
${Button_close_card_2}   //div//div//button[@class='Cart_cart__close__d9rmd']
${Card_product_detail}     //div[@class='cart__products-list']

#Logout
${Message_SignIn_Success}  //div[contains(text(), 'Đăng nhập thành công')]
${Avt}   (//div[@class='Header_header__actions-group__sLYqM'])[1]
${Button_Logout}   (//li[@class='Header_header__user-option__EGhmN'])[2]
${Message_Logout_Success}  //div//div[contains(text(), 'Đăng xuất thành công')]
${Button_close_alert}    //button[@aria-label='close']

#ViewAccountInformation
${Button_Personal_Page}   //a[@href='/auth/profile']//li[@class='Header_header__user-option__EGhmN']
${Input_HoTen}    //input[@placeholder='Họ tên']
${Input_Email}    //input[@placeholder='Email']

#View order list
${DonMua_Status_HoanThanh}     //div[contains(text(), 'Hoàn thành (7)')]
${List_DonHang}   //div[@class='HistoryOderItem_item-wrapper__JlZ8U']

#Purchase
${Button_Pay}    //div//button//p[contains(text(), 'Thanh toán')]
${Button_Pay_Disable}    //button[@class='Button_wrapper__6uHX0 Button_primary__CHwmz Button_disabled__UuTSG Button_order__Jbyhw']
${Final_Text_Step_Pays}   //div//h1[contains(text(), 'Bước cuối cùng - Thanh toán')]
${Button_Order}     //div//button//p[contains(text(), 'Đặt đơn')]
${Button_Đơn_Hang}    (//button//p[contains(text(),'Đơn hàng')])[2]
${Input_sđt}     //div//input[@id='phone-number']
${Input_address}     //div//input[@id='address-input']
${Note}    //div//input[@placeholder='Hãy gọi điện trước cho tôi']
${Message_order_create_success}   //div//div[contains(text(), 'Đặt hàng thành công')]
${Message_error_sđt}     //div//span[contains(text(), 'Số điện thoại không được để trống')]
${Message_error_address}     //div//span[contains(text(), 'Địa chỉ không được để trống')]
${Icon_loading}    //div[@class='modal-loading__content']
${Pay_By_E_Wallet}     //div//label//span[contains(text(), 'Thanh toán bằng Ví Điện Tử HaUI Food')]
${Logo}     //a//img[@class='Header_header__logo__QkqZR']

*** Keywords ***
Clear Text
    [Arguments]    ${Clear_element}
    Click Element    ${Clear_element}
    Press Keys    ${Clear_element}    CTRL+a    BACKSPACE

Go to Account information
    wait until element is visible    ${Avt}    ${timeout}
    sleep    3s
    click element    ${Avt}
    wait until element is visible    ${Button_Personal_Page}    ${TimeOut}
    click element    ${Button_Personal Page}

Open Browser Headless Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --user-data-dir=/tmp/chrome-data-${random.randint(0, 100000)}
    Open Browser    ${URL}    chrome    options=${options}
