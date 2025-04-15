*** Settings ***
Resource    ../Resource/SignIn.resource
Resource    ../Resource/Search.resource
Resource    ../Resource/Library.resource
Resource    ../Resource/Utils.resource
Suite Setup    Open Browwer And Login

*** Variables ***

*** Keywords ***

*** Test Cases ***
Product search successful enter correct product name
    Search success with text detail

Product search successful enter approximate product name
    Search success

Product search fails when product does not exist
    wait until element is visible    ${Input_Search}    ${TimeOut}
    input text    ${Input_Search}    Bánh Mỳ
    sleep    3s
    wait until element is visible    ${Message_error_search}    ${TimeOut}
