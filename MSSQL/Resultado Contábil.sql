SELECT FORMAT(LAN.DTMOV, 'MM/yyyy') AS "Mes",
       PLA0.CTACTB  AS "Conta Contábil_ID" ,
       PLA0.DESCRCTA AS "Conta Contábil",
       LAN.CODCENCUS AS "Centro de Resultado_ID",
       CUS.DESCRCENCUS AS "Centro de Resultado",
       LAN.CODEMP AS "Empresa_ID",
       EMP.NOMEFANTASIA AS "Empresa",
       COALESCE(LAN.CODHISTCTB,-999) AS "Histórico_ID",
       COALESCE(HIS.HISTORICO,'Sem Histórico') AS "Histórico",
       SUM(CASE WHEN LAN.TIPLANC = 'R' THEN LAN.VLRLANC ELSE LAN.VLRLANC * -1 END) AS "Resultado Contábil"
FROM TCBLAN LAN
LEFT JOIN TCBPLA PLA0 ON LAN.CODCTACTB = PLA0.CODCTACTB
LEFT JOIN TCBHIS HIS ON LAN.CODHISTCTB = HIS.CODHISTCTB
LEFT JOIN TSIEMP EMP ON LAN.CODEMP = EMP.CODEMP
LEFT JOIN TSICUS CUS ON LAN.CODCENCUS = CUS.CODCENCUS
WHERE PLA0.CODCTACTB NOT IN (SELECT DISTINCT CODCTACTBENCRES FROM TCBEMP WHERE CODCTACTBENCRES IS NOT NULL)
GROUP BY FORMAT(LAN.DTMOV, 'MM/yyyy'),
         LAN.CODEMP ,
         EMP.NOMEFANTASIA ,
         LAN.CODCENCUS ,
         CUS.DESCRCENCUS ,
         LAN.CODCTACTB ,
         PLA0.CTACTB ,
         PLA0.DESCRCTA ,
         LAN.CODHISTCTB ,
         HIS.HISTORICO
