*** Settings ***
Documentation  Automated tests for shopping cart functionality
Library        SeleniumLibrary


*** Variables ***
${CLOSE_POPUP_WINDOW_1}    //html/body/div[10]/div/button[2]
${SEARCH_INPUT}            //header/div[1]/div[1]/div[2]/form[1]/input[1]
${CLICK_SEARCH}            //header/div[1]/div[1]/div[2]/form[1]/label[1]/input[1]
${PRODUCT_CLICK}           //html/body/div[1]/div[1]/div[2]/div[3]/ul/li[2]/div/a[1]
${PRODUCT_CLICK_2}         //html/body/div[2]/div/div[2]/div[2]/div[15]/a[2]
${SECOND_CART_CHECH}       //i[contains(text(),'1')]


*** Test Cases ***
Adding Product To Shopping Catr Should Increase Products Amount
    Prepare Env
    [Setup]         Open Shop Webpage
    Search Product
    Input Product Name
    Go To Product View
    Add Product To Shopping Cart
    Close Popup Window
    Check If Shopping Cart Has 1 Product
    [Teardown]    Close Browser

*** Keywords ***
Prepare Env
    Set Screenshot Directory    screanshots

Open Shop Webpage
    Open Browser     https://www.banggood.com/    chrome
    Maximize Browser Window
    Click Button                ${CLOSE_POPUP_WINDOW_1}

Search Product
    Click Element                 ${SEARCH_INPUT}

Input Product Name
    Input Text                    ${SEARCH_INPUT}      HOTA S6 AC
    Click Element                 ${CLICK_SEARCH}

Go To Product View
    Click Element                 ${PRODUCT_CLICK}

Add Product To Shopping Cart
    Click Element                 ${PRODUCT_CLICK_2}

Close Popup Window
    Reload Page

Check If Shopping Cart Has 1 Product
    Element Text Should Be         ${SECOND_CART_CHECH}        1
