SQLite format 3   @     �   	                                                            � .4 � � ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               �E�YtableemployeesemployeesCREATE TABLE employees
(Employee VARCHAR(200) NOT NULL,
Code Varchar(50) NOT NULL,
Mailbox VARCHAR(200) NOT NULL,
FOREIGN KEY (mailbox) REFERENCES mailboxes(mailbox))�T�wtablemailboxesmailboxesCREATE TABLE mailboxes 
(Tower VARCHAR(20) NOT NULL,
Mailbox VARCHAR(200) NOT NULL,
ID VARCHAR(92) NOT NULL PRIMARY KEY,
Country VARCHAR(50),
Sender_ID VARCHAR(100) UNIQUE NOT NULL)1E indexsqlite_autoindex_mailboxes_2mailboxes1E indexsqlite_autoindex_mailboxes_1mailboxes          �    	�`�
b
�
	Y� Z�a�
b ��h                                                                                                                                             �"-�E_PTPPayments.Borsodi00000000D2FDE2A215C63F40B016AC7A73DCE5C10100F26DBD5C02C76F4EBDEE660D7C70868C0000000001080000nanE5ED330BA8874AB1BFAE38B3E01AFDB9-GMPAYBOR�$1�E_HRHRServiceCenterSRB000000002E26B3EAE23EF84EA26EC80A09B4CE900100F4FA1E2AA9C62B45802E9971492188490000000001080000None517763888CB24438896F9911E2AD9774-GMHRSCSR�$1�E_HRHRServiceCenterMNE00000000BE4229A7FA16F740B923848DF05DC3040100741ED348C15AE548938B8F9257E991200000000001080000NoneF919FE7EBA5447E1A27AC47A9745CDA5-GMHRSCMN�);�E_PTPAccountsPayable.Borsodi00000000C452026807541942A697E20983C08430010085D2C2697ED01D43ABC34033D37907D50000000001080000nanB229B2997F4341CAAFBEA5F370DDA370-GMACCBOR�%3�E_PTPAccountsPayable.mce00000000C44A826815C39D468D4CBEFE3F1FFD0D01003ADDC664D37110449DF4A1B6D45AF7A60000000001080000nan900FD611687B42C08949FB40C9B9ABC3-GMACCMCE�-C�E_PTPAccountsPayable.Staropramen00000000D13A20D35CF01C438EEF681B4B2BE0040100F34157B1ED8191499BD6F4E8B617E6930000000001080000nan718A9E3B0D0643FF8B1B26AC6954E429-GMACCSTA�$1�E_PTPTravelExpenses.mce000000005814C3056AB78849A9656B7DFA2D4DDC01003CCED35391FCE742A2ABCE99707AF0420000000001080000nanEC5457C2E40F4573BFFFD7467F6D5758-GMTRAMCE�%�E_PTPPayments.mce000000007349EA459716A64CAC2C00C0D69034F601008E5D46982CA0A54B8F6F17A94D21A7E40000000001080000nanD94A7C7EBB3D4791B0F7C84E90439CD1-GMPAYMCE�&5�E_PTPPayments.Staropramen000000007ABF413047CCA44EAA720DBF1193D17101001DA85CE1C98C6B44A962BA046CE7904E0000000001080000nanDB9A82CF68D8487891A84F3D25ABDED4-GMPAYSTA�,A�E_PTPTravelExpenses.Staropramen00000000BA0FDE4CC5731049A12E1294443F5C0F0100800F2D17545D5E419A11C8EF1251D1DD0000000001080000nanE0E132397B234E479613FCA9FD4EF0C9-GMTEXSTA�#/�E_PTPPayments.Slovakia00000000D708EC3538C3264AA6B7AD720B40962701004C53EE45B4042F4589022A3B69E4381C0000000001080000nanC340816CA2594A01B8184063A614000B-GMPAYSLO�);�E_PTPTravelExpenses.Slovakia0000000091905A02FB33764E983B06CA7B9B2D5C01008ADC361E791FB74E8CAC9D291F32CC480000000001080000nan42CFD448952B41D381F9D94058670829-GMTRASLO�*=�E_PTPAccountsPayable.Slovakia00000000CE51BEA02E3DAC48ACDE81328C3F416D0100732895D6924E7B438286536A4147D05B0000000001080000nanDF8093BE54404B26BE7DB359C14DCFDF-GMACCSLO�(
9�E_PTPTravelExpenses.Borsodi000000008EC4FAB5E16D844398D433E39F8BE60E01008560A51BE1FB7C448100F72ECC5A04440000000001080000nanEA7E7AD8353E406388D5DB73172AF1DB-GMTRABOR�,	3�E!_PTPMNE.AccountsPayable00000000E8D154378C8FC24F902607F486A859B90100023D3ADCF893BE4295A73DB163B53A3C0000000001080000Muntenegru49AD1CC225ED4190986F4415A1160B53-GMMNEACP�,3�E!_PTPMNE.Travel&Expenses00000000B53AE752D9EAF745BC0253F53BB4070F01004EF518F8C2F7E049A45A0C70B04A7B100000000001080000Muntenegru05E591125EFE47C6A766F4CF903F03C9-GMMNETRE�%%�E!_PTPMNE.Payments0000000099189F3C074CFD42AD8A85B7FDF5A672010076D36219CD16014898DCAC29D45F23880000000001080000MuntenegruDF2E07BD8088463785711A58C7E2A08D-GMMNEPAY�(3�E_PTPSER.AccountsPayable0000000023838CC3A6CE894E9437E961FD0845FC0100102F7F4433CAB64C83B0B3BF2D1203960000000001080000Serbia4B78B9F3F74843AB8B84FD699A76A2E6-GMSERACP�(3�E_PTPSER.Travel&Expenses00000000E71B78C0E5A9764C9D473C61C3AF481501009C04258B084BC9449E4F8204D62049510000000001080000Serbia4810CD9F6F6943A594894AB875F3CF42-GMSERTRE�!%�E_PTPSER.Payments00000000367F7EE65F91C74CA9B6CD993CC8B5B101005388E349376FD14ABE22F60D45D157C30000000001080000Serbia1B9CC907535A428D8C4E32BAE5D6E7EE-GMSERPAY�)7�EeMDDMO Material Requests00000000D4A8AEC21A21A144BB22B29B3AFFB149010022AD315AA55B384389D68306F6F2C363000000B213890000nan26ade4a6050840e798d653178cb0864c-DMO Materia�.G�E_MDSupply Chain Master Data Team00000000551255037E57514881543A15E69345E601009F5559951F6EC84BA386089710AEE21E0000000001090000nan53D90FEC55F447FA8C91CEA1FE5A8A55-_XSUPPLY�'�E[MDMasterData UK00000000A361840D66245A4C94917213F46D2B6101008A0C2B779097FE47B8C676D29306C82D0000000001090000nan0aa421979c6949659b575c07a6e1fc44-z   
   � �3y�=		�
C�-iS��
�����	Y��o                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             a�E0000000082657DCA86D4F041A489312E33E6A86801001CE9D537E886064DA0981B1E97B1A5F10000000001090000a�E00000000EB9C169FD466CC43836844F496CFC8F40100FEEF9C86A55B7D45884F6F5B0959876F0000000001090000a�E00000000E997BC7A3BEFAC48A9D9024076204BFE0100C5D6AD4730310649B140C629502E4A270000000001090000a�E000000004C99708678E524458386B36F2418F03701008CF019C868013C4D9AAE7123AA1CBC720000000001080000a�E000000002E26B3EAE23EF84EA26EC80A09B4CE900100F4FA1E2AA9C62B45802E9971492188490000000001080000a�E00000000BE4229A7FA16F740B923848DF05DC3040100741ED348C15AE548938B8F9257E991200000000001080000a�E00000000C452026807541942A697E20983C08430010085D2C2697ED01D43ABC34033D37907D50000000001080000a�E00000000D2FDE2A215C63F40B016AC7A73DCE5C10100F26DBD5C02C76F4EBDEE660D7C70868C0000000001080000a�E00000000C44A826815C39D468D4CBEFE3F1FFD0D01003ADDC664D37110449DF4A1B6D45AF7A60000000001080000a�E00000000D13A20D35CF01C438EEF681B4B2BE0040100F34157B1ED8191499BD6F4E8B617E6930000000001080000a�E000000005814C3056AB78849A9656B7DFA2D4DDC01003CCED35391FCE742A2ABCE99707AF0420000000001080000a�E000000007349EA459716A64CAC2C00C0D69034F601008E5D46982CA0A54B8F6F17A94D21A7E40000000001080000a�E000000007ABF413047CCA44EAA720DBF1193D17101001DA85CE1C98C6B44A962BA046CE7904E0000000001080000a�E00000000BA0FDE4CC5731049A12E1294443F5C0F0100800F2D17545D5E419A11C8EF1251D1DD0000000001080000a�E00000000D708EC3538C3264AA6B7AD720B40962701004C53EE45B4042F4589022A3B69E4381C0000000001080000a�E0000000091905A02FB33764E983B06CA7B9B2D5C01008ADC361E791FB74E8CAC9D291F32CC480000000001080000a�E00000000CE51BEA02E3DAC48ACDE81328C3F416D0100732895D6924E7B438286536A4147D05B0000000001080000a�E000000008EC4FAB5E16D844398D433E39F8BE60E01008560A51BE1FB7C448100F72ECC5A04440000000001080000
a�E00000000E8D154378C8FC24F902607F486A859B90100023D3ADCF893BE4295A73DB163B53A3C0000000001080000	a�E00000000B53AE752D9EAF745BC0253F53BB4070F01004EF518F8C2F7E049A45A0C70B04A7B100000000001080000a�E0000000099189F3C074CFD42AD8A85B7FDF5A672010076D36219CD16014898DCAC29D45F23880000000001080000a�E0000000023838CC3A6CE894E9437E961FD0845FC0100102F7F4433CAB64C83B0B3BF2D1203960000000001080000a�E00000000E71B78C0E5A9764C9D473C61C3AF481501009C04258B084BC9449E4F8204D62049510000000001080000a�E00000000367F7EE65F91C74CA9B6CD993CC8B5B101005388E349376FD14ABE22F60D45D157C30000000001080000a�E00000000D4A8AEC21A21A144BB22B29B3AFFB149010022AD315AA55B384389D68306F6F2C363000000B213890000a�E00000000551255037E57514881543A15E69345E601009F5559951F6EC84BA386089710AEE21E0000000001090000`�E	00000000A361840D66245A4C94917213F46D2B6101008A0C2B779097FE47B8C676D29306C82D0000000001090000
   ' ��Hv��b���'U���:� N�|h4�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         -_60D5B8C815FE45A7A07E8310F42C8DFF-ZZBPOCB1-_61FC1C7970EC4C7F94291997F9B7E759-GMBPOM25,]73270657F1EC42E6B6EB4CA70B9CB803-GMBPO16-_317028D7799E48A28F58899DEBF2E73C-GMPROGBS-_517763888CB24438896F9911E2AD9774-GMHRSCSR-_F919FE7EBA5447E1A27AC47A9745CDA5-GMHRSCMN-_B229B2997F4341CAAFBEA5F370DDA370-GMACCBOR-_E5ED330BA8874AB1BFAE38B3E01AFDB9-GMPAYBOR-_900FD611687B42C08949FB40C9B9ABC3-GMACCMCE-_718A9E3B0D0643FF8B1B26AC6954E429-GMACCSTA-_EC5457C2E40F4573BFFFD7467F6D5758-GMTRAMCE-_D94A7C7EBB3D4791B0F7C84E90439CD1-GMPAYMCE-_DB9A82CF68D8487891A84F3D25ABDED4-GMPAYSTA-_E0E132397B234E479613FCA9FD4EF0C9-GMTEXSTA-_C340816CA2594A01B8184063A614000B-GMPAYSLO-_42CFD448952B41D381F9D94058670829-GMTRASLO-_DF8093BE54404B26BE7DB359C14DCFDF-GMACCSLO-_EA7E7AD8353E406388D5DB73172AF1DB-GMTRABOR
-_49AD1CC225ED4190986F4415A1160B53-GMMNEACP	-_05E591125EFE47C6A766F4CF903F03C9-GMMNETRE-_DF2E07BD8088463785711A58C7E2A08D-GMMNEPAY-_4B78B9F3F74843AB8B84FD699A76A2E6-GMSERACP-_4810CD9F6F6943A594894AB875F3CF42-GMSERTRE-_1B9CC907535A428D8C4E32BAE5D6E7EE-GMSERPAY0e26ade4a6050840e798d653178cb0864c-DMO Materia-_53D90FEC55F447FA8C91CEA1FE5A8A55-_XSUPPLY*[	0aa421979c6949659b575c07a6e1fc44-zzmduk   �    �9
��{A���_7��q8��P"
�
�
�
e
9
		�	�	~	M	���qK ���b#��xH��k6	��pB��t@��zO ���n � �7   AP-C1Tiberiu PintilieCodul Super Unic si MinunatHRServiceCenterSRBFO-M1Tiberiu PintilieCodul Super Unic si NemaintalnitHRServiceCenterMNE   5Q=1Baica Slobodanca LiubitaGBSBA89HRServiceCenterSRB-L#9Tamas BorosGBS08TB8TravelExpenses.Borsodi.K#;Tamas BorosGBS08TB8AccountsPayable.Borsodi*J'/Bogdan BaiasuGBS07BB7Payments.Slovakia%I'%Bogdan BaiasuGBS07BB7Payments.mce-H'5Bogdan BaiasuGBS07BB7Payments.Staropramen)G'-Bogdan BaiasuGBS07BB7Payments.Borsodi0F';Bogdan BaiasuGBS07BB7AccountsPayable.Borsodi/E'9Andrei FloreaGBS06AF6TravelExpenses.Borsodi0D';Andrei FloreaGBS06AF6AccountsPayable.Borsodi/C%;Alin FazakasGBS05AF5AccountsPayable.Borsodi2B+;Sandra CorbeanuGBS04SC4TravelExpenses.Slovakia-A+1Sandra CorbeanuGBS04SC4TravelExpenses.mce5@+ASandra CorbeanuGBS04SC4TravelExpenses.Staropramen3?+=Sandra CorbeanuGBS04SC4AccountsPayable.Slovakia1>'=Monica VladutGBS03MV3AccountsPayable.Slovakia,='3Monica VladutGBS03MV3AccountsPayable.mce4<'CMonica VladutGBS03MV3AccountsPayable.Staropramen/;%;Daniela TomaGBS02DT2TravelExpenses.Slovakia0:%=Daniela TomaGBS02DT2AccountsPayable.Slovakia+9%3Daniela TomaGBS02DT2AccountsPayable.mce38%CDaniela TomaGBS02DT2AccountsPayable.Staropramen4791Alexandra ProtopopescuGBS01AP1TravelExpenses.mce<69AAlexandra ProtopopescuGBS01AP1TravelExpenses.Staropramen259-Alexandra ProtopopescuGBS01AP1Payments.Borsodi349/Alexandra ProtopopescuGBS01AP1Payments.Slovakia.39%Alexandra ProtopopescuGBS01AP1Payments.mce6295Alexandra ProtopopescuGBS01AP1Payments.Staropramen:19=Alexandra ProtopopescuGBS01AP1AccountsPayable.Slovakia5093Alexandra ProtopopescuGBS01AP1AccountsPayable.mce=/9CAlexandra ProtopopescuGBS01AP1AccountsPayable.Staropramen-.)3Nadica DrlnovaGBS05ND5SER.Travel&Expenses.-+3Mirela OrabovicGBS07MO3SER.Travel&Expenses-,)3Nadica DrlnovaGBS05ND5MNE.Travel&Expenses.++3Mirela OrabovicGBS07MO3MNE.Travel&Expenses)*/%Florentina SimionGBS09FS1SER.Payments$)%%Marko IvanovGBS08MI2SER.Payments)(/%Florentina SimionGBS09FS1MNE.Payments$'%%Marko IvanovGBS08MI2MNE.Payments.&+3Mirela OrabovicGBS07MO3SER.AccountsPayable*%#3Silvia BicaGBS06SB4SER.AccountsPayable-$)3Nadica DrlnovaGBS05ND5SER.AccountsPayable/#-3Remus GheorghitaGBS04RG6SER.AccountsPayable+"%3Josip SpicarGBS03JS7SER.AccountsPayable.!+3Duska BorojevicGBS02DB8SER.AccountsPayable, '3Aurora BaltatGBS01AB9SER.AccountsPayable.+3Mirela OrabovicGBS07MO3MNE.AccountsPayable*#3Silvia BicaGBS06SB4MNE.AccountsPayable-)3Nadica DrlnovaGBS05ND5MNE.AccountsPayable/-3Remus GheorghitaGBS04RG6MNE.AccountsPayable+%3Josip SpicarGBS03JS7MNE.AccountsPayable.+3Duska BorojevicGBS02DB8MNE.AccountsPayable,'3Aurora BaltatGBS01AB9MNE.AccountsPayable:-GLaurentiu VasileLIVASILE1Supply Chain Master Data Team4%GAna TanasoiuTXANA81Supply Chain Master Data Team=1!GLaurentiu StanescuLgstanes10Supply Chain Master Data Team5'GCristian NicuCpnicu1Supply Chain Master Data Team7'GBogdan Neacsubxneacsu8Supply Chain Master Data Team9+GAlexandru MarinAGMARIN77Supply Chain Master Data Team7%!GIoana Mafteiixmaftei22Supply Chain Master Data Team'''Mihail Neata MANEAAA90MasterData UK'%!'Andrei Ursu UXANDREI01MasterData UK&%'Elena Berca EDBERCA33MasterData UK()'Andreea Sandu axsandu18MasterData UK-1!'Andreea Marinescu ACMARINE01MasterData UK+#7Marius SavuGBSKS95DMO Material Requests,%7Secu GabrielGBSJY49DMO Material Requests,
%7Rontu EdmondGBSXO59DMO Material Requests8	=7Razvan-Alexandru FlorianGBSKH61DMO Material Requests.)7Razvan RusescuGBSVO78DMO Material Requests-'7Bogdan DraganGBSKL00DMO Material Requests.)7Valentin VulpeGBSCU37DMO Material Requests-'7Arabella StanGBSYX05DMO Material Requests577Cezara Stefania NeaguGBSQT20DMO Material Requests0-7Claudiu CatargiuGBSJU13DMO Material Requests*!7Irina JigaGBSIM63DMO Material Requests0-7Catalin PaltaneaGBSWO66DMO Material Req   ,7 ,4��p9
��{A���_7��q8��P"
�
�
�
e
9
		�	�	~	M	���qK ���b#��xH��k6	��pB��t@��zO ���n777      �C1Tiberiu PintilieCodul Super Unic si MinunatHRServiceCenterSRB   HM1Tiberiu PintilieCodul Super Unic si NemaintalnitHRServiceCenterMNE     �1Baica Slobodanca LiubitaGBSBA89HRServiceCenterSRB-L#9Tamas BorosGBS08TB8TravelExpenses.Borsodi.K#;Tamas BorosGBS08TB8AccountsPayable.Borsodi*J'/Bogdan BaiasuGBS07BB7Payments.Slovakia%I'%Bogdan BaiasuGBS07BB7Payments.mce-H'5Bogdan BaiasuGBS07BB7Payments.Staropramen)G'-Bogdan BaiasuGBS07BB7Payments.Borsodi0F';Bogdan BaiasuGBS07BB7AccountsPayable.Borsodi/E'9Andrei FloreaGBS06AF6TravelExpenses.Borsodi0D';Andrei FloreaGBS06AF6AccountsPayable.Borsodi/C%;Alin FazakasGBS05AF5AccountsPayable.Borsodi2B+;Sandra CorbeanuGBS04SC4TravelExpenses.Slovakia-A+1Sandra CorbeanuGBS04SC4TravelExpenses.mce5@+ASandra CorbeanuGBS04SC4TravelExpenses.Staropramen3?+=Sandra CorbeanuGBS04SC4AccountsPayable.Slovakia1>'=Monica VladutGBS03MV3AccountsPayable.Slovakia,='3Monica VladutGBS03MV3AccountsPayable.mce4<'CMonica VladutGBS03MV3AccountsPayable.Staropramen/;%;Daniela TomaGBS02DT2TravelExpenses.Slovakia0:%=Daniela TomaGBS02DT2AccountsPayable.Slovakia+9%3Daniela TomaGBS02DT2AccountsPayable.mce38%CDaniela TomaGBS02DT2AccountsPayable.Staropramen4791Alexandra ProtopopescuGBS01AP1TravelExpenses.mce<69AAlexandra ProtopopescuGBS01AP1TravelExpenses.Staropramen259-Alexandra ProtopopescuGBS01AP1Payments.Borsodi349/Alexandra ProtopopescuGBS01AP1Payments.Slovakia.39%Alexandra ProtopopescuGBS01AP1Payments.mce6295Alexandra ProtopopescuGBS01AP1Payments.Staropramen:19=Alexandra ProtopopescuGBS01AP1AccountsPayable.Slovakia5093Alexandra ProtopopescuGBS01AP1AccountsPayable.mce=/9CAlexandra ProtopopescuGBS01AP1AccountsPayable.Staropramen-.)3Nadica DrlnovaGBS05ND5SER.Travel&Expenses.-+3Mirela OrabovicGBS07MO3SER.Travel&Expenses-,)3Nadica DrlnovaGBS05ND5MNE.Travel&Expenses.++3Mirela OrabovicGBS07MO3MNE.Travel&Expenses)*/%Florentina SimionGBS09FS1SER.Payments$)%%Marko IvanovGBS08MI2SER.Payments)(/%Florentina SimionGBS09FS1MNE.Payments$'%%Marko IvanovGBS08MI2MNE.Payments.&+3Mirela OrabovicGBS07MO3SER.AccountsPayable*%#3Silvia BicaGBS06SB4SER.AccountsPayable-$)3Nadica DrlnovaGBS05ND5SER.AccountsPayable/#-3Remus GheorghitaGBS04RG6SER.AccountsPayable+"%3Josip SpicarGBS03JS7SER.AccountsPayable.!+3Duska BorojevicGBS02DB8SER.AccountsPayable, '3Aurora BaltatGBS01AB9SER.AccountsPayable.+3Mirela OrabovicGBS07MO3MNE.AccountsPayable*#3Silvia BicaGBS06SB4MNE.AccountsPayable-)3Nadica DrlnovaGBS05ND5MNE.AccountsPayable/-3Remus GheorghitaGBS04RG6MNE.AccountsPayable+%3Josip SpicarGBS03JS7MNE.AccountsPayable.+3Duska BorojevicGBS02DB8MNE.AccountsPayable,'3Aurora BaltatGBS01AB9MNE.AccountsPayable:-GLaurentiu VasileLIVASILE1Supply Chain Master Data Team4%GAna TanasoiuTXANA81Supply Chain Master Data Team=1!GLaurentiu StanescuLgstanes10Supply Chain Master Data Team5'GCristian NicuCpnicu1Supply Chain Master Data Team7'GBogdan Neacsubxneacsu8Supply Chain Master Data Team9+GAlexandru MarinAGMARIN77Supply Chain Master Data Team7%!GIoana Mafteiixmaftei22Supply Chain Master Data Team'''Mihail Neata MANEAAA90MasterData UK'%!'Andrei Ursu UXANDREI01MasterData UK&%'Elena Berca EDBERCA33MasterData UK()'Andreea Sandu axsandu18MasterData UK-1!'Andreea Marinescu ACMARINE01MasterData UK+#7Marius SavuGBSKS95DMO Material Requests,%7Secu GabrielGBSJY49DMO Material Requests,
%7Rontu EdmondGBSXO59DMO Material Requests8	=7Razvan-Alexandru FlorianGBSKH61DMO Material Requests.)7Razvan RusescuGBSVO78DMO Material Requests-'7Bogdan DraganGBSKL00DMO Material Requests.)7Valentin VulpeGBSCU37DMO Material Requests-'7Arabella StanGBSYX05DMO Material Requests577Cezara Stefania NeaguGBSQT20DMO Material Requests0-7Claudiu CatargiuGBSJU13DMO Material Requests*!7Irina JigaGBSIM63DMO Material Requests0-7Catalin PaltaneaGBSWO66DMO Material Requests   =� T%��s;��d.���i3
�
�
f
7
	�	�	o	=	���`1���o@�����uL!���A
��>	��L��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <m)SCostin BlidaruPTPSD07BPO-CBL.Accounts Payable ProcessingIl)mCostin BlidaruPTPSD07GM BPO-USandCorporate.Accounts PayableProcessing3k)ACostin BlidaruPTPSD07GM BPO-Molson.APProcessingDjmVlad IoanPTPSD06GM BPO-USandCorporate.Accounts PayableProcessing7iSVlad IoanPTPSD06BPO-CBL.Accounts Payable Processing<h)SDragos StanciuPTPSD05BPO-CBL.Accounts Payable Processing3g)ADragos StanciuPTPSD05GM BPO-Molson.APProcessingBf5SValentina HerasteanuPTPSD04BPO-CBL.Accounts Payable Processing9e5AValentina HerasteanuPTPSD04GM BPO-Molson.APProcessingKd-mMadalina BurlacuPTPSD03GM BPO-USandCorporate.Accounts PayableProcessing5c-AMadalina BurlacuPTPSD03GM BPO-Molson.APProcessing=b+SDaniela LautaruPTPSD02BPO-CBL.Accounts Payable Processing4a+ADaniela LautaruPTPSD02GM BPO-Molson.APProcessing8`!SArina MicuPTPSD01BPO-CBL.Accounts Payable Processing/_!AArina MicuPTPSD01GM BPO-Molson.APProcessing)^))Vlad MarinacheGBS01PR05procurementGBS']%)Diana BanciuGBS01PR04procurementGBS,\/)Adelina PalaghianGBS01PR03procurementGBS*[+)Rebecca StuparuGBS01PR02procurementGBS)Z))Ruxandra SlaveGBS01PR01procurementGBS5Q=1Baica Slobodanca LiubitaGBSBA89HRServiceCenterSRB-L#9Tamas BorosGBS08TB8TravelExpenses.Borsodi.K#;Tamas BorosGBS08TB8AccountsPayable.Borsodi*J'/Bogdan BaiasuGBS07BB7Payments.Slovakia%I'%Bogdan BaiasuGBS07BB7Payments.mce-H'5Bogdan BaiasuGBS07BB7Payments.Staropramen)G'-Bogdan BaiasuGBS07BB7Payments.Borsodi0F';Bogdan BaiasuGBS07BB7AccountsPayable.Borsodi/E'9Andrei FloreaGBS06AF6TravelExpenses.Borsodi0D';Andrei FloreaGBS06AF6AccountsPayable.Borsodi/C%;Alin FazakasGBS05AF5AccountsPayable.Borsodi2B+;Sandra CorbeanuGBS04SC4TravelExpenses.Slovakia-A+1Sandra CorbeanuGBS04SC4TravelExpenses.mce5@+ASandra CorbeanuGBS04SC4TravelExpenses.Staropramen3?+=Sandra CorbeanuGBS04SC4AccountsPayable.Slovakia1>'=Monica VladutGBS03MV3AccountsPayable.Slovakia,='3Monica VladutGBS03MV3AccountsPayable.mce4<'CMonica VladutGBS03MV3AccountsPayable.Staropramen/;%;Daniela TomaGBS02DT2TravelExpenses.Slovakia0:%=Daniela TomaGBS02DT2AccountsPayable.Slovakia+9%3Daniela TomaGBS02DT2AccountsPayable.mce38%CDaniela TomaGBS02DT2AccountsPayable.Staropramen4791Alexandra ProtopopescuGBS01AP1TravelExpenses.mce<69AAlexandra ProtopopescuGBS01AP1TravelExpenses.Staropramen259-Alexandra ProtopopescuGBS01AP1Payments.Borsodi349/Alexandra ProtopopescuGBS01AP1Payments.Slovakia.39%Alexandra ProtopopescuGBS01AP1Payments.mce6295Alexandra ProtopopescuGBS01AP1Payments.Staropramen:19=Alexandra ProtopopescuGBS01AP1AccountsPayable.Slovakia5093Alexandra ProtopopescuGBS01AP1AccountsPayable.mce=/9CAlexandra ProtopopescuGBS01AP1AccountsPayable.Staropramen-.)3Nadica DrlnovaGBS05ND5SER.Travel&Expenses.-+3Mirela OrabovicGBS07MO3SER.Travel&Expenses+Y#7Aise IusmenGBSNP06DMO Material Requests/X+7Corina CioflincGBSXQ23DMO Material Requests-W'7Marius PetreaGBSNV61DMO Material Requests-V+1Katarina Pejkicnikson17HRServiceCenterSRB-U+1Katarina Pejkicnikson17HRServiceCenterMNE+T+1Milanka LemajicMila87HRServiceCenterMNE+S+1Milanka LemajicMila87HRServiceCenterSRB5R=1Baica Slobodanca LiubitaGBSBA89HRServiceCenterMNE     a�`�
b
�
	Y� Z�a�
b ��h                                                                                                                                             b �-�E_PTPPayments.Borsodi00000000D2FDE2A215C63F40B016AC7A73DCE5C10100F26DBD5C02C76F4EBDEE660D7C70868C0000000001080000nanE5ED330BA8874AB1BFAE38B3E01AFDB9-GMPAYBOR  �1�E_HRHRServiceCenterSRB000000002E26B3EAE23EF84EA26EC80A09B4CE900100F4FA1E2AA9C62B45802E9971492188490000000001080000None517763888CB24438896F9911E2AD9774-GMHRSCSR�$1�E_HRHRServiceCenterMNE00000000BE4229A7FA16F740B923848DF05DC3040100741ED348C15AE548938B8F9257E991200000000001080000NoneF919FE7EBA5447E1A27AC47A9745CDA5-GMHRSCMN�);�E_PTPAccountsPayable.Borsodi00000000C452026807541942A697E20983C08430010085D2C2697ED01D43ABC34033D37907D50000000001080000nanB229B2997F4341CAAFBEA5F370DDA370-GMACCBOR  �3�E_PTPAccountsPayable.mce00000000C44A826815C39D468D4CBEFE3F1FFD0D01003ADDC664D37110449DF4A1B6D45AF7A60000000001080000nan900FD611687B42C08949FB40C9B9ABC3-GMACCMCE�-C�E_PTPAccountsPayable.Staropramen00000000D13A20D35CF01C438EEF681B4B2BE0040100F34157B1ED8191499BD6F4E8B617E6930000000001080000nan718A9E3B0D0643FF8B1B26AC6954E429-GMACCSTA�$1�E_PTPTravelExpenses.mce000000005814C3056AB78849A9656B7DFA2D4DDC01003CCED35391FCE742A2ABCE99707AF0420000000001080000nanEC5457C2E40F4573BFFFD7467F6D5758-GMTRAMCE�%�E_PTPPayments.mce000000007349EA459716A64CAC2C00C0D69034F601008E5D46982CA0A54B8F6F17A94D21A7E40000000001080000nanD94A7C7EBB3D4791B0F7C84E90439CD1-GMPAYMCE�&5�E_PTPPayments.Staropramen000000007ABF413047CCA44EAA720DBF1193D17101001DA85CE1C98C6B44A962BA046CE7904E0000000001080000nanDB9A82CF68D8487891A84F3D25ABDED4-GMPAYSTA�,A�E_PTPTravelExpenses.Staropramen00000000BA0FDE4CC5731049A12E1294443F5C0F0100800F2D17545D5E419A11C8EF1251D1DD0000000001080000nanE0E132397B234E479613FCA9FD4EF0C9-GMTEXSTA�#/�E_PTPPayments.Slovakia00000000D708EC3538C3264AA6B7AD720B40962701004C53EE45B4042F4589022A3B69E4381C0000000001080000nanC340816CA2594A01B8184063A614000B-GMPAYSLO�);�E_PTPTravelExpenses.Slovakia0000000091905A02FB33764E983B06CA7B9B2D5C01008ADC361E791FB74E8CAC9D291F32CC480000000001080000nan42CFD448952B41D381F9D94058670829-GMTRASLO�*=�E_PTPAccountsPayable.Slovakia00000000CE51BEA02E3DAC48ACDE81328C3F416D0100732895D6924E7B438286536A4147D05B0000000001080000nanDF8093BE54404B26BE7DB359C14DCFDF-GMACCSLO�(
9�E_PTPTravelExpenses.Borsodi000000008EC4FAB5E16D844398D433E39F8BE60E01008560A51BE1FB7C448100F72ECC5A04440000000001080000nanEA7E7AD8353E406388D5DB73172AF1DB-GMTRABOR�,	3�E!_PTPMNE.AccountsPayable00000000E8D154378C8FC24F902607F486A859B90100023D3ADCF893BE4295A73DB163B53A3C0000000001080000Muntenegru49AD1CC225ED4190986F4415A1160B53-GMMNEACP�,3�E!_PTPMNE.Travel&Expenses00000000B53AE752D9EAF745BC0253F53BB4070F01004EF518F8C2F7E049A45A0C70B04A7B100000000001080000Muntenegru05E591125EFE47C6A766F4CF903F03C9-GMMNETRE�%%�E!_PTPMNE.Payments0000000099189F3C074CFD42AD8A85B7FDF5A672010076D36219CD16014898DCAC29D45F23880000000001080000MuntenegruDF2E07BD8088463785711A58C7E2A08D-GMMNEPAY�(3�E_PTPSER.AccountsPayable0000000023838CC3A6CE894E9437E961FD0845FC0100102F7F4433CAB64C83B0B3BF2D1203960000000001080000Serbia4B78B9F3F74843AB8B84FD699A76A2E6-GMSERACP�(3�E_PTPSER.Travel&Expenses00000000E71B78C0E5A9764C9D473C61C3AF481501009C04258B084BC9449E4F8204D62049510000000001080000Serbia4810CD9F6F6943A594894AB875F3CF42-GMSERTRE�!%�E_PTPSER.Payments00000000367F7EE65F91C74CA9B6CD993CC8B5B101005388E349376FD14ABE22F60D45D157C30000000001080000Serbia1B9CC907535A428D8C4E32BAE5D6E7EE-GMSERPAY�)7�EeMDDMO Material Requests00000000D4A8AEC21A21A144BB22B29B3AFFB149010022AD315AA55B384389D68306F6F2C363000000B213890000nan26ade4a6050840e798d653178cb0864c-DMO Materia�.G�E_MDSupply Chain Master Data Team00000000551255037E57514881543A15E69345E601009F5559951F6EC84BA386089710AEE21E0000000001090000nan53D90FEC55F447FA8C91CEA1FE5A8A55-_XSUPPLY�'�E[MDMasterData UK00000000A361840D66245A4C94917213F46D2B6101008A0C2B779097FE47B8C676D29306C82D0000000001090000nan0aa421979c6949659b575c07a6e1fc44-zzmduk   � �	`�h
�
	o�!^]��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                �5S�E_PTPBPO-CBL.Accounts Payable Processing0000000082657DCA86D4F041A489312E33E6A86801001CE9D537E886064DA0981B1E97B1A5F10000000001090000nan60D5B8C815FE45A7A07E8310F42C8DFF-ZZBPOCB1�,A�E_PTPGM BPO-Molson.APProcessing00000000EB9C169FD466CC43836844F496CFC8F40100FEEF9C86A55B7D45884F6F5B0959876F0000000001090000nan61FC1C7970EC4C7F94291997F9B7E759-GMBPOM25�Am�E]PTPGM BPO-USandCorporate.Accounts PayableProcessing00000000E997BC7A3BEFAC48A9D9024076204BFE0100C5D6AD4730310649B140C629502E4A270000000001090000nan73270657F1EC42E6B6EB4CA70B9CB803-GMBPO16�$1�E_HRHRServiceCenterSRB000000002E26B3EAE23EF84EA26EC80A09B4CE900100F4FA1E2AA9C62B45802E9971492188490000000001080000None517763888CB24438896F9911E2AD9774-GMHRSCSR�$1�E_HRHRServiceCenterMNE00000000BE4229A7FA16F740B923848DF05DC3040100741ED348C15AE548938B8F9257E991200000000001080000NoneF919FE7EBA5447E1A27AC47A9745CDA5-GMHRSCMN�);�E_PTPAccountsPayable.Borsodi00000000C452026807541942A697E20983C08430010085D2C2697ED01D43ABC34033D37907D50000000001080000nanB229B2997F4341CAAFBEA5F370DDA370-GMACCBOR�"-�E_PTPPayments.Borsodi00000000D2FDE2A215C63F40B016AC7A73DCE5C10100F26DBD5C02C76F4EBDEE660D7C70868C0000000001080000nanE5ED330BA8874AB1BFAE38B3E01AFDB9-GMPAYBOR�%3�E_PTPAccountsPayable.mce00000000C44A826815C39D468D4CBEFE3F1FFD0D01003ADDC664D37110449DF4A1B6D45AF7A60000000001080000nan900FD611687B42C08949FB40C9B9ABC3-GMACCMCE�-C�E_PTPAccountsPayable.Staropramen00000000D13A20D35CF01C438EEF681B4B2BE0040100F34157B1ED8191499BD6F4E8B617E6930000000001080000nan718A9E3B0D0643FF8B1B26AC6954E429-GMACCSTA�$1�E_PTPTravelExpenses.mce000000005814C3056AB78849A9656B7DFA2D4DDC01003CCED35391FCE742A2ABCE99707AF0420000000001080000nanEC5457C2E40F4573BFFFD7467F6D5758-GMTRAMCE�%�E_PTPPayments.mce000000007349EA459716A64CAC2C00C0D69034F601008E5D46982CA0A54B8F6F17A94D21A7E40000000001080000nanD94A7C7EBB3D4791B0F7C84E90439CD1-GMPAYMCE�&5�E_PTPPayments.Staropramen000000007ABF413047CCA44EAA720DBF1193D17101001DA85CE1C98C6B44A962BA046CE7904E0000000001080000nanDB9A82CF68D8487891A84F3D25ABDED4-GMPAYSTA�,A�E_PTPTravelExpenses.Staropramen00000000BA0FDE4CC5731049A12E1294443F5C0F0100800F2D17545D5E419A11C8EF1251D1DD0000000001080000nanE0E132397B234E479613FCA9FD4EF0C9-GMTEXSTA�#/�E_PTPPayments.Slovakia00000000D708EC3538C3264AA6B7AD720B40962701004C53EE45B4042F4589022A3B69E4381C0000000001080000nanC340816CA2594A01B8184063A614000B-GMPAYSLO�)�E_PTPprocurementGBS000000004C99708678E524458386B36F2418F03701008CF019C868013C4D9AAE7123AA1CBC720000000001080000UK317028D7799E48A28F58899DEBF2E73C-GMPROGBS