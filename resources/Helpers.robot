*Settings*
Documentation       Teste Helpers

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Postgres
    Insert User  ${user}
    Disconnect From Database