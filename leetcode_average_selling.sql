-- https://leetcode.com/problems/average-selling-price/description/

select p.product_id, 
   COALESCE(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0)  as average_price
 from Prices p 
 left join UnitsSold u 
 on p.product_id = u.product_id 
 and u.purchase_date >= p.start_date 
 and u.purchase_date <= p.end_date
 group by p.product_id