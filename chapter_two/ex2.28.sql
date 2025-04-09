select SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0
or QuantityOnOrder = 0
order by WarehouseID desc, SKU asc;