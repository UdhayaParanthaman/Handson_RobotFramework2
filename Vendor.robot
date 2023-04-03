*** Settings ***
Documentation    This file has to test the application
Library    SeleniumLibrary    timeout=0:00:05
Variables    vendorSuite.py
resource    general/general.resource




*** Test Cases ***
Launch the Url and check dashboard is opening   
    go to dashboardPage
    Page Should Contain    ${pagetxt}
    
Click VendorLogin and check page is opening
    Click Link    ${vendorLoginclk}
    Select Window    NEW
    Page Should Contain Element    ${vendorpageTxt} 
    
Check vendor login Credentials
    Input Text     input-email    ${userName}
    Input Password    input-password    ${password}
    Click Element    ${loginBtn}  
    Close Browser
                       
    