query 50100 FirstQuery
{
    Caption = 'First Query';
    QueryType = Normal;
    QueryCategory = 'Customer List';
    OrderBy = descending(Document_Date);
    TopNumberOfRows = 5;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Customer_No; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Document_Date; "Document Date")
                {
                    //Method = Year;
                }
            }
            // filter(Filter_Balance; Balance)
            // {
            // }
        }
    }
    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin
    end;
}