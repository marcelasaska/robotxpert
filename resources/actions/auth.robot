***Settings***
Documentation           Ações de autorização


***Keywords***
Go To Login Page
    Go To           https://bodytest-web-marcela.herokuapp.com/dashboard

Login With
    [Arguments]     ${email}        ${pass}

    Fill Text       css=input[name=email]       ${email}
    Fill Text       css=input[name=password]    ${pass}
    Click           text=Entrar



