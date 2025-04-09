select SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand between 2 and 9;