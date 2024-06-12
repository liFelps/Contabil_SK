SELECT TO_CHAR(SAL.REFERENCIA, 'MM/YYYY') AS "Mes",
       PLA0.CTACTB AS "Conta Contábil_ID" ,
       SAL.CODEMP AS "Empresa_ID",
       EMP.NOMEFANTASIA AS "Empresa",
       PLA0.DESCRCTA AS "Conta Contábil",
       SAL.CODCENCUS AS "Centro de Resultado_ID",
       CUS.DESCRCENCUS AS "Centro de Resultado",
       SAL.SALDOINICMES AS "Saldo Contábil"
FROM TCBSAL SAL
LEFT JOIN TCBPLA PLA0 ON SAL.CODCTACTB = PLA0.CODCTACTB
LEFT JOIN TSIEMP EMP ON SAL.CODEMP = EMP.CODEMP
LEFT JOIN TSICUS CUS ON SAL.CODCENCUS = CUS.CODCENCUS
