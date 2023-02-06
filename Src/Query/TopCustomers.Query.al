query 50109 TopCustomers
{
    Caption = 'Top N Customers';
    QueryType = Normal;
    OrderBy = ascending(BalanceLCY);
    //QueryCategory = 'Customer List';
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(City; City)
            {
            }
        }
    }
}