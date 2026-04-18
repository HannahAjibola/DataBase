SELECT 
    I.SKU,
    I.SKU_Description,
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
ON 
    I.WarehouseID = W.WarehouseID
WHERE 
    W.WarehouseCity = 'Atlanta'
    OR W.WarehouseCity = 'Bangor'
    OR W.WarehouseCity = 'Chicago';

SELECT 
    I.SKU,
    I.SKU_Description,
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');
    
 SELECT 
    I.SKU,
    I.SKU_Description,
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.WarehouseCity <> 'Atlanta'
    AND W.WarehouseCity <> 'Bangor'
    AND W.WarehouseCity <> 'Chicago';
    
    SELECT 
    I.SKU,
    I.SKU_Description,
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');
    
    SELECT 
    SKU_Description || ' is located in ' || WarehouseCity AS ItemLocation
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID;
    
    
    SELECT 
    SKU,
    SKU_Description,
    WarehouseID
FROM 
    INVENTORY
WHERE 
    WarehouseID IN (
        SELECT WarehouseID
        FROM WAREHOUSE
        WHERE Manager = 'Lucille Smith'
    );
    
    
    SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID
FROM 
    INVENTORY I, WAREHOUSE W
WHERE 
    I.WarehouseID = W.WarehouseID
    AND W.Manager = 'Lucille Smith';
    
    SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.Manager = 'Lucille Smith';
    
    SELECT 
    WarehouseID,
    AVG(QuantityOnHand) AS AvgQuantity
FROM 
    INVENTORY
WHERE 
    WarehouseID IN (
        SELECT WarehouseID
        FROM WAREHOUSE
        WHERE Manager = 'Lucille Smith'
    )
GROUP BY 
    WarehouseID;
    
    SELECT 
    I.WarehouseID,
    AVG(I.QuantityOnHand) AS AvgQuantity
FROM 
    INVENTORY I, WAREHOUSE W
WHERE 
    I.WarehouseID = W.WarehouseID
    AND W.Manager = 'Lucille Smith'
GROUP BY 
    I.WarehouseID;
    
    SELECT 
    I.WarehouseID,
    AVG(I.QuantityOnHand) AS AvgQuantity
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.Manager = 'Lucille Smith'
GROUP BY 
    I.WarehouseID;
    
    SELECT 
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState,
    W.Manager,
    I.SKU,
    I.SKU_Description,
    I.QuantityOnHand
FROM 
    INVENTORY I
JOIN 
    WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE 
    W.Manager = 'Lucille Smith';
    
    SELECT 
    WarehouseID,
    SUM(QuantityOnOrder) AS TotalItemsOnOrder,
    SUM(QuantityOnHand) AS TotalItemsOnHand
FROM 
    INVENTORY
GROUP BY 
    WarehouseID, QuantityOnOrder;
    
 --    2.54, Subquery: A query inside another query Used for filtering or intermediate results
--     Join: Combines rows from multiple tablesUsed when you need columns from multiple tables

SELECT 
    W.*,
    I.SKU,
    I.SKU_Description,
    I.QuantityOnHand,
    I.QuantityOnOrder
FROM 
    WAREHOUSE W
LEFT JOIN 
    INVENTORY I
    ON W.WarehouseID = I.WarehouseID;
