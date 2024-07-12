-- https://leetcode.com/problems/confirmation-rate/

select s.user_id,  

  ROUND( COALESCE( 
  (select count(c.user_id) from confirmations c where c.user_id = s.user_id and c.action = 'confirmed' group by c.user_id) / 
  (select count(cc.user_id) from confirmations cc where cc.user_id = s.user_id group by cc.user_id),  
  0), 2) as 'confirmation_rate' 
  
  from signups s