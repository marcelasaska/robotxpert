***Settings***
Documentation       Remover Planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Cenário: Remover cadastro de plano
    
    &{plan}     Create Dictionary       title=Plano Americano      duration=2     price=29.99     total=R$ 59,98

    Insert Plan                 ${plan}
    Go To Plans  
    Search Plan By Title        ${plan.title}
    Request Removal by Title    ${plan.title}
    Confirm Removal Plan
    Toaster Text Should Be      Plano removido com sucesso
    
Cenário: Desistir da exclusão do plano
    [tags]      excluir
    &{plan}     Create Dictionary       title=Plano Geral     duration=12     price=240.00     total=R$ 2880,00

    Insert Plan                 ${plan}
    Go To Plans
    Search Plan By Title        ${plan.title} 
    Request Removal by Title    ${plan.title}  
    Cancel Removal Plan
    Plan Should Be Visible      ${plan.title}

    