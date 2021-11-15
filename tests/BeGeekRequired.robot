*Settings*
Documentation           BeGeek test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Try Been Geek
Test Teardown           Finish Session

*Variables*
${INPUT_WHATS}      11999999999
${INPUT_DESC}       Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.
${INPUT_VAL}        300
${INV_WHATS_MSG}    O Whatsapp deve ter 11 digitos contando com o DDD
${INV_DESC_MSG}     Informe a descrição do seu trabalho
${INV_VAL_MSG}      Valor hora deve ser numérico

*Test Cases*

Invalid info
    [Tags]          inv_whats
    [Template]      Fill Invalid Form
    ${EMPTY}            ${INPUT_DESC}       ${INPUT_VAL}        ${INV_WHATS_MSG}
    11                  ${INPUT_DESC}       ${INPUT_VAL}        ${INV_WHATS_MSG}
    1199999999          ${INPUT_DESC}       ${INPUT_VAL}        ${INV_WHATS_MSG}
    ${INPUT_WHATS}      ${EMPTY}            ${INPUT_VAL}        ${INV_DESC_MSG}
    ${INPUT_WHATS}      ${INPUT_DESC}       ${EMPTY}            ${INV_VAL_MSG}
    ${INPUT_WHATS}      ${INPUT_DESC}       a                   ${INV_VAL_MSG}
    ${INPUT_WHATS}      ${INPUT_DESC}       a2                  ${INV_VAL_MSG}
    ${INPUT_WHATS}      ${INPUT_DESC}       ab3                 ${INV_VAL_MSG}
    ${INPUT_WHATS}      ${INPUT_DESC}       abc#1               ${INV_VAL_MSG}


*Keywords*
Fill Invalid Form
    [Arguments]     ${whats}        ${desc}     ${val}      ${expected_alert}

    ${geek_profile}         Create Dictionary
    ...                     whats=${whats}          desc=${desc}
    ...                     printer_repair=Sim      work=Remoto
    ...                     cost=${val}

    Fill Geek Form              ${geek_profile}
    Submit Geek Form
    Alert Span Should Be        ${expected_alert}

Try Been Geek
    Start Session
    ${user}         Factory User        inv_profile
    Do Login                ${user}
    Go To Geek Form
