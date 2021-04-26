***Settings***
Documentation       Atualizar Alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Atualizar plano cadastrado

    ${fixture}      Get JSON   plans-update.json

    ${anual}       Set Variable    ${fixture['before']}
    ${semestral}     Set Variable    ${fixture['after']}

    Remove Plan                     ${anual['title']}    
    Remove Plan                     ${semestral['title']} 

  
    Insert Plan                     ${anual}
    Go To Plans
    Search Plan By Title            ${anual['title']}
    Go To Plan Update Form          ${anual['title']}   
            

    Update A Plan                   ${semestral} 
    Toaster Text Should Be         Plano Atualizado com sucesso 

    [Teardown]                    Thinking And Take Screenshot        2

