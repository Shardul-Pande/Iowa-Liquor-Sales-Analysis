-- Top 20 Stores
select top 20 Store_SK,sum(Invoice_Sale_Dollars) as total_sales
from fct_iowa_liquor_sales_invoice_header
group by Store_SK
order by sum(Invoice_Sale_Dollars) desc

--Top 20 cities
select top 20 g.City_SK,g.City, sum(h.Invoice_Sale_Dollars) as total_sales
from Dim_Iowa_Liquor_Geo g
join Dim_Iowa_Liquor_Stores s on s.Geo_SK=g.Geo_SK
join fct_iowa_liquor_sales_invoice_header h on h.Store_SK=s.Store_SK
group by g.City_SK,g.City
order by sum(h.Invoice_Sale_Dollars) desc

--Top 20 counties
select top 10 g.County_SK,g.County, sum(h.Invoice_Sale_Dollars) as tptal_sales
from Dim_Iowa_Liquor_Geo g
join Dim_Iowa_Liquor_Stores s on s.Geo_SK=g.Geo_SK
join fct_iowa_liquor_sales_invoice_header h on h.Store_SK=s.Store_SK
group by g.County_SK,g.County
order by sum(h.Invoice_Sale_Dollars) desc

--top 20 categories
select top 20 c.Category_Number,c.Category_Name, sum(h.Invoice_Sale_Dollars)as total_sales
from Dim_iowa_liquor_Product_Categories c
join Dim_iowa_liquor_Products p on p.Category_SK=c.Category_SK
join fct_iowa_liquor_sales_invoice_lineitem l on l.Item_SK=p.Item_SK
join fct_iowa_liquor_sales_invoice_header h  on  h.Invoice_Number=l.Invoice_Number
group by c.Category_Number,c.Category_Name
order by sum(h.Invoice_Sale_Dollars) desc

--top 50 items
select top 50 p.Item_SK,p.Item_Description, sum(h.Invoice_Sale_Dollars)as total_sales
from  Dim_iowa_liquor_Products p 
join fct_iowa_liquor_sales_invoice_lineitem l on l.Item_SK=p.Item_SK
join fct_iowa_liquor_sales_invoice_header h  on  h.Invoice_Number=l.Invoice_Number
group by p.Item_SK,p.Item_Description
order by sum(h.Invoice_Sale_Dollars) desc

--top 20 vendors
select top 20 c.Vendor_Number,c.Vendor_Name, sum(h.Invoice_Sale_Dollars) as total_sales
from Dim_iowa_liquor_Vendors c
join Dim_iowa_liquor_Products p on p.Vendor_SK=c.Vendor_SK
join fct_iowa_liquor_sales_invoice_lineitem l on l.Item_SK=p.Item_SK
join fct_iowa_liquor_sales_invoice_header h  on  h.Invoice_Number=l.Invoice_Number
group by c.Vendor_Number,c.Vendor_Name
order by sum(h.Invoice_Sale_Dollars) desc