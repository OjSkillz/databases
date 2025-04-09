select SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand > 1
and QuantityOnHand < 10;
