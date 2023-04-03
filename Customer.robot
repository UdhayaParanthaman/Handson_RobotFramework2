*** Settings ***
Documentation    This file has to test the purshasing products
Library    SeleniumLibrary
resource    General/general.resource
Variables    customerSuite.py
Variables    vendorSuite.py
Library    FakerLibrary

*** Variables ***
${customerEmail}
${customerPassword}


*** Test Cases ***
Launching the Url and check DashBaoard page is Opening
    go to dashboardPage
    Page Should Contain    ${pagetxt}
    
click CustomerPage DashBoard and check page is Loading
    Click Link    ${customerLoginclk}  
    Select Window    NEW
    Page Should Contain    ${customerDashboardPageTxt} 
   
    
click registerBtn and successfully register
    Click Link    ${customerRegisterbtn} 
    Page Should Contain    ${customerRegisterPageTxt}
    #Page Should Contain Element    //a[normalize-space()='login page']  
    Click Button    ${customerGroup}      
     ${name}=    FakerLibrary.First Name
     Input Text    ${firstName}    ${name}
     ${lName}=    FakerLibrary.Last Name
     Input Text    ${lastName}    ${lName}
     
     ${customerEmail}=    FakerLibrary.Email    
     Input Text    ${email}    ${customerEmail}
     Set Global Variable    ${customerEmail}    
     
     ${phoneNo}=    FakerLibrary.Phone Number
     Input Text    ${phNo}    ${phoneNo}
     
     ${customerPassword}=    FakerLibrary.Password 
     Input Password    ${passwordlocator}      ${customerPassword}
     Set Global Variable    ${customerPassword}    
     Input Password    ${confirmPass}    ${customerPassword}
     
     Click Button    ${subscribeRadiBtn}   
     Click Element    ${clickChechBox}
     Click Element    ${clickSubmit}
     Page Should Contain        ${successRegisterPageTxt}  
     
Verify successfully loggedOut
   Click Element    ${customerLogOutClick}
   Page Should Contain    ${customerLogOutPageTxt}        

     
Verify Customer has to logged in successfully
    Click Element    ${customerSignInClick}    
    Input Text    ${email}    ${customerEmail}
    Input Password    ${passwordlocator}    ${customerPassword}    
    Click Element    ${customerSubmitLoginBtn} 
    Page Should Contain    ${customerLoginPageTxt}       
        
                

                   