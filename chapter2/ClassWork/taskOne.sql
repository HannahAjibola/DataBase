select SKU, SKU_Description from INVENTORY;

select SKU_Description, SKU from INVENTORY;

select WarehouseID from INVENTORY;

select distinct WarehouseID from INVENTORY;

select WarehouseID, SKU_Description, QuantityOnHand, QuantityOnOrder from INVENTORY;

select * from INVENTORY;

select * from INVENTORY where QuantityOnHand > 0;

select SKU, SKU_Description from INVENTORY where QuantityOnHand = 0;

select SKU, SKU_Description, WarehouseId from INVENTORY where QuantityOnHand  = 0 order by WarehouseID asc;

select SKU, SKU_Description, WarehouseId from INVENTORY where QuantityOnHand  > 0 order by WarehouseID desc, SKU asc ;

select SKU, SKU_Description, WarehouseID from INVENTORY where QuantityOnHand  = 0 and QuantityOnOrder > 0 order by WarehouseID desc, SKU ASC ;

select SKU, SKU_Description, WarehouseID from INVENTORY where QuantityOnHand  = 0 or QuantityOnOrder = 0 order by WarehouseID desc, SKU ASC ;

select SKU, SKU_Description, WarehouseID, QuantityOnHand from INVENTORY where QuantityOnHand  > 1 and QuantityOnHand < 10;

select distinct SKU, SKU_Description from INVENTORY where SKU_Description like 'Half-Dome%';

select distinct SKU, SKU_Description from INVENTORY where SKU_Description like '%Climb%';

SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '__d%';

SELECT 
    COUNT(QuantityOnHand) AS TotalRecords,
    SUM(QuantityOnHand) AS TotalQuantity,
    AVG(QuantityOnHand) AS AverageQuantity,
    MIN(QuantityOnHand) AS MinimumQuantity,
    MAX(QuantityOnHand) AS MaximumQuantity
FROM INVENTORY;

SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;


-- 2.35, COUNT IS COUNTING THE AMOUNT OF ROWS AND SUM IS ADDING OR SUMMING ALL THE ROWS TOGETHER

-- 2.39, WHERE QuantityOnHand < 3 is applied first to remove rows
-- Then the remaining data is grouped
-- Then HAVING COUNT(SKU) < 2 is applied to the grouped results
