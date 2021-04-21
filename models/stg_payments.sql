select 
  ID Payment_ID,
  OrderID Order_ID,
  PaymentMethod Payment_Method,
  Amount/100 Amount,
  Status,
  Created as Created_AT,
  _Batched_AT
from raw.stripe.payment p

