restore filelistonly from disk='c:\temp\bkmodprod.bak'

restore database ModProd 
from disk='c:\temp\bkmodprod.bak'
with 
move 'ModProd' to	'W:\Diego\Datos\ModProd.mdf',
move 'ModProd2'	to 'W:\Diego\Datos\ModProd2.mdf',
move 'ModProdHist' to	'W:\Diego\Datos\ModProdHist.mdf',
move 'ModProdHist2' to	'W:\Diego\Datos\ModProdHist2.mdf',
move 'ModProd_log' to	'W:\Diego\Datos\ModProd_log.LDF'

