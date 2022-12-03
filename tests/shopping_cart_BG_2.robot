*** Settings ***
Documentation    Automation test to add an item to shopping cart
Library          SeleniumLibrary

*** Variables ***
${BROWSER}            firefox
${URL}                https://www.banggood.com/
${POPUP_1}            //html/body/div[10]/div/button[2]
${POPUP_2}            //html/body/div[3]/div/div/a
${POPUP_3}            //html/body/div[15]/div/i
${CART_AMMOUNT}       //html/body/header/div[1]/div/div[4]/ul/li[2]/a/i[1]
${SEARCH_BAR}         //html/body/header/div[1]/div/div[2]/form/input[1]
${PRODUCT_NAME}       HOTA S6 AC
${CLICK_SEARCH}       //html/body/header/div[1]/div/div[2]/form/label/input
${PRODUCT_PAGE}       //html/body/div[1]/div[1]/div[2]/div[3]/ul/li[2]/div/span[1]/a
${ADD_TO_CART}        //html/body/div[2]/div/div[2]/div[2]/div[15]/a[2]

*** Test Cases ***
Adding Product To Shopping Catr Should Increase Products Amount
    Prepare Env
    [Setup]    Open Shop Webpage
    Close Popup
    Check Shopping Cart Ammount Is 0
    Search Product
    Go To Product View
    Add Product To Shopping Cart
    Check Shopping Cart Ammount Is 1
#    [Teardown]    Close Browser

*** Keywords ***
Prepare Env
    Set Selenium Speed              0.5
    Set Screenshot Directory        screanshots_2

Open Shop Webpage
    Open Browser                    ${URL}      ${BROWSER}
    Maximize Browser Window

Close Popup
    ${Result}=  Page Should Contain Element    ${POPUP_1}
    Run Keyword If    '${Result}'=='PASS'    Click Button     ${POPUP_1}
    ${Result_1}=  Page Should Contain Element    ${POPUP_2}
    Run Keyword If    '${Result_1}'=='PASS'    Click Button    ${POPUP_2}

Check Shopping Cart Ammount Is ${AMMOUNT}
    Element Text Should Be        ${CART_AMMOUNT}        ${AMMOUNT}

Search Product
    Input Text    ${SEARCH_BAR}    ${PRODUCT_NAME}
    Click Element    ${CLICK_SEARCH}

Go To Product View
    Click Element    ${PRODUCT_PAGE}

Add Product To Shopping Cart
    Click Element    ${ADD_TO_CART}

Close Popup 2
    ${Result_2}=  Page Should Contain Element    ${POPUP_3}
    Run Keyword If    '${Result_2}'=='PASS'    Click Button    ${POPUP_3}
