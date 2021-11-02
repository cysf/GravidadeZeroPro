*Settings*
Documentation       Login test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login

    ${user}                         Factory User Login

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Pass
    [Tags]          inv_pass

    ${user}         Create Dictionary       email=cintiafelippe@gmail.com       password=abc123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

User not found
    [Tags]          user_404

    ${user}         Create Dictionary       email=cintiafelippe@404.net       password=abc123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]          inv_email

    ${user}         Create Dictionary       email=cintiafelippe.com.br       password=abc123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Should Be Type Email

Blank Email
    [Tags]          no_email

    ${user}         Create Dictionary       email=${EMPTY}      password=pwd123

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Alert Span Should Be            E-mail obrigatório

Blank Pass
    [Tags]          no_pass

    ${user}         Create Dictionary       email=cintiafelippe@gmail.com      password=${EMPTY}

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Alert Span Should Be            Senha obrigatória

Required Fields Login
    [Tags]          reqflog

    @{expected_alerts}              Create List
    ...                             E-mail obrigatório
    ...                             Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be           ${expected_alerts}