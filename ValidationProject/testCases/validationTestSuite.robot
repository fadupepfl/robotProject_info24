*** Settings ***
Library                                    SeleniumLibrary    


*** Variables ***
${browser}=    gc
${url}=                                    https://opensource-demo.orangehrmlive.com/
${username}                                admin
${url2}=                                   http://omayo.blogspot.com/
${url3}=                                   https://login.salesforce.com/?locale=fr-ca
${error_message}=                          Vérifiez votre nom d'utilisateur et votre mot de passe. 
...                                        Si vous ne parvenez toujours pas à vous connecter, 
...                                        contactez votre administrateur Salesforce.



*** Test Cases ***
TC_001_test_login_validation
    Open Browser                           ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed                     0.5s
    Input Text                             id=txtUsername    Admin  
    Input Password                         id=txtPassword    admin123
    Click Button                           id=btnLogin 
    Page Should Contain                    Dashboard 
    Page Should not Contain                Dashboard123 
          
    Click Element                          id=welcome 
    Click Element                          link=Logout 
    ${speed}=                              Get Selenium Speed
    Log To Console                         ${speed}     
    Close Window  
    
TC_002_test_validation_text_field
    Open Browser                           ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed                     0.2s
    Page Should Contain Textfield          id=txtUsername    #textfiled
    Input Text                             id=txtUsername    Admin
    Page Should Contain Element            id=txtPassword    
    Input Password                         id=txtPassword    admin123
    Click Button                           id=btnLogin 
    Page Should Contain                    Dashboard 
    Page Should not Contain                Dashboard123 
    Click Element                          id=welcome 
    Click Element                          link=Logout 
    Close Window
    
TC_003_test_validation_check_box
    Open Browser                           ${url2}    ${browser}
    Maximize Browser Window
    Set Selenium Speed                     0.2s
    Click Element                          id=checkbox2
    Checkbox Should Be Selected            id=checkbox2
    Click Element                          id=checkbox2
    Checkbox Should not Be Selected        id=checkbox2
    Close Window
    
TC_004_test_validation_text
    Open Browser                           ${url3}    ${browser}
    Maximize Browser Window
    Set Selenium Speed                     0.2s
    Input Text                             id=username    Admin
    Input Password                         id=password    admin123
    Click Element                          id=Login 
    #${message_login_erreur}=               Get Text    id=error
    #Element Text Should Be                 id=error    ${error_message}  
    Element Should Contain                 id=error    ${error_message}                      
    Close Window   
    
TC_005_test_validation_Title
    Open Browser                           ${url3}    ${browser}
    Maximize Browser Window
    Set Selenium Speed                     0.2s
    Title Should Be                        Connexion | Salesforce   
    Element Should Be Enabled              id=username 
    #Element Should Be Disabled            id=password 
    Element Should Be Visible              id=password                   
    Close Window    
    
TC_006_display_simple_text
    Log To Console                         Hello Github                               
    