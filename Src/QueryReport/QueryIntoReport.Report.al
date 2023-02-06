report 50100 QueryIntoReport
{
    Caption = 'Top Customers';
    //CaptionML = ENU = 'Name', DAN = 'Navn', ESP = 'Nombre', FRA = 'Nom', ENC = 'Name';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ReportLayout/Top customers.rdl';


    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number);

            column(customerNo; customerNo)
            {
            }
            column(customerName; customerName)
            {
            }
            column(customerBalance; customerBalance)
            {
            }
            column(city; city)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, Top);
                TopCustomers.TopNumberOfRows(Top);    //<---- TopNumberOfRows is an In-Built Procedure
                TopCustomers.open();
            end;

            trigger OnAfterGetRecord()
            begin
                if TopCustomers.Read() then begin
                    customerNo := TopCustomers.No;
                    customerName := TopCustomers.Name;
                    customerBalance := TopCustomers.BalanceLCY;
                    city := TopCustomers.City;
                end
                else
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Generating Top Customers")
                {
                    field(TopN; Top)
                    {
                        Caption = 'Top Records which you like to generate a report:';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        Top := 3;
    end;

    var
        TopCustomers: Query TopCustomers;
        Top: Integer;
        customerNo: Code[20];
        customerName: Text[30];
        customerBalance: Decimal;
        city: Text;
}